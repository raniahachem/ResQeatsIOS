//
//  map.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI
import MapKit

struct map:View {
    //map properties
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var mapSelection: MKMapItem?
    @Namespace private var locationSpace
    @State private var viewingRegion:MKCoordinateRegion?
    //search properties
    @State private var searchText: String = ""
    @State private var showSearch: Bool = false
    @State private var searchResults: [MKMapItem] = []
    //map selecttion detail properties
    @State private var showDetails: Bool = false
    @State private var lookAroundScene:MKLookAroundScene?
    //Routes properties
    @State private var routeDisplaying:Bool = false
    @State private var route:MKRoute?
    @State private var routeDestination: MKMapItem?
    
   // var body: some View {
    var body: some View{
        NavigationStack{
            Map(position: $cameraPosition , selection: $mapSelection , scope: locationSpace ){
                //Map annotations
                Annotation("My location", coordinate: .userLocation){
                    ZStack{
                        Image(systemName: "applelogo")
                            .font(.title3)
                        Image(systemName: "square")
                            .font(.largeTitle)
                    }
                    
                }
                .annotationTitles(.hidden)
                
                //simply display annotation as Marker , as we seen before
                ForEach(searchResults, id: \.self){ mapItem in
                   // hiding all other Markers , except the one of destination
                    if routeDisplaying{
                        if mapItem == routeDestination{
                            let placemark = mapItem.placemark
                            Marker(placemark.name ?? "Place" , coordinate:placemark.coordinate)
                                 .tint(.blue)
                       }
                    }
                       else{
                        let placemark = mapItem.placemark
                        Marker(placemark.name ?? "Place", coordinate:
                                 placemark.coordinate)
                        .tint(.blue)
                    }
                 }
                // display routes using polyline
                if let route {
                    MapPolyline(route.polyline)
                    
                    // applying big stroke
                        .stroke(.blue , lineWidth:7)
                
                }
                //to show user current location
                UserAnnotation()
            }
            .onMapCameraChange ({ ctx in
                viewingRegion = ctx.region
            })
            .overlay(alignment: .bottomTrailing){
                VStack(spacing:15){
                    MapCompass(scope: locationSpace)
                    MapPitchToggle(scope: locationSpace)
                    MapUserLocationButton(scope:locationSpace )
                }
                .buttonBorderShape(.circle)
                .padding()
            }
            .mapScope(locationSpace)
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
            //searchBar
            .searchable(text: $searchText, isPresented: $showSearch)
            //showing Translucent toolBar
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            // when route displaying hiding top and bottom bar
            .toolbar(routeDisplaying ? .hidden: .visible, for: .navigationBar)
            .sheet(isPresented: $showDetails,onDismiss :{
                withAnimation(.snappy){
                    //Zooming routes
                    if let boundingRect = route?.polyline.boundingMapRect ,
                    routeDisplaying{
                        cameraPosition = .rect(boundingRect)
                    }
                }
            }, content:{
                MapDetails()
                    .presentationDetents([.height(300)])
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
                    .presentationCornerRadius(25)
                    .interactiveDismissDisabled(true)
                
            })
        }
        .onSubmit(of: .search) {
            Task{
                guard !searchText.isEmpty else{return}
                await searchPlaces()
            }
            
        }
        .onChange(of: showSearch, initial: false){
            if !showSearch{
                //clearing search results
                searchResults.removeAll(keepingCapacity: false)
                showDetails = false
                //zooming out to user regin when search is cancelled
                withAnimation(.snappy){
                    cameraPosition = .region(.userRegion)
                }
                
            }
        }
        .onChange(of: mapSelection){oldValue , newValue in
            //displaying details about the selected place
            showDetails = newValue != nil
            //fetching look around preview whenever selection changes
            fetchLookAroundPreview()
        }
    }
    // map details
    @ViewBuilder
    func MapDetails() -> some View {
        VStack(spacing:15){
            ZStack{
                // new look Around API
                if lookAroundScene == nil {
                    // New empty view API
                    ContentUnavailableView("No Preview available", systemImage: "eye.slash")
                }else{
                    LookAroundPreview(scene: $lookAroundScene)
                }
            }
            .frame(height: 200)
            .clipShape(.rect(cornerRadius: 15))
            //close button
            .overlay(alignment:.topTrailing){
                Button(action:{
                    //closing views
                    showDetails = false
                    withAnimation(.snappy){
                        mapSelection = nil
                    }
                } , label:{
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .background(.white , in: .circle)
                })
                .padding(10)
            }
            
            //Direction's button
            Button("Get Directions", action: fetchRoutes)
                    .foregroundStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical,12)
                    .background(.blue.gradient, in:.rect(cornerRadius: 15))
        }
        .padding(15)
    }
    //search places
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = viewingRegion ?? .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        searchResults = results?.mapItems ?? []
    }
    // fetchong location preview
    func fetchLookAroundPreview(){
        if let mapSelection{
            //clearing old one
            lookAroundScene = nil
            Task{
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
    // fetching route
    func fetchRoutes(){
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = .init(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            Task{
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                
                // saving routes destination
                routeDestination = mapSelection
                withAnimation(.snappy){
                   routeDisplaying = true
                    showDetails = false
                    
                   
                }
            }
        }
    }
}

#Preview {
    map()
}
extension CLLocationCoordinate2D{
    static var userLocation:  CLLocationCoordinate2D{
        return.init(latitude: 37.3346 , longitude:-122.0090)
    }
}

extension MKCoordinateRegion{
    static var userRegion : MKCoordinateRegion{
        return.init(center: .userLocation , latitudinalMeters: 10000,longitudinalMeters: 10000 )
    }
}




