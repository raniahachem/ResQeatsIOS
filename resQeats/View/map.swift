//
//  map.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI
import MapKit

struct map: View {
    @State private var cameraPosition:MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplaying = false
    @State private var route:MKRoute?
    @State private var routeDestination:MKMapItem?
    var body: some View {
        Map(position: $cameraPosition , selection: $mapSelection){
       //     Marker("My location" ,systemImage: "paperplane",coordinate: .userLocation)
         //       .tint(.blue)
            UserAnnotation()
            Annotation("My location", coordinate: .userLocation){
                ZStack{
                    Circle()
                        .frame(width: 32 , height: 32)
                        .foregroundColor(.blue.opacity(0.25))
                    
                    Circle()
                        .frame(width: 20 , height: 20)
                        .foregroundColor(.white)
                    
                    Circle()
                        .frame(width: 12 , height: 12)
                        .foregroundColor(.blue)
                }
            }
            
            ForEach(results , id:\.self){  item in
                if routeDisplaying{
                    if item == routeDestination{
                        let placemark = item.placemark
                        Marker(placemark.name ?? "" , coordinate: placemark.coordinate)
                        
                    }
                }
                else{
                    let placemark = item.placemark
                    Marker(placemark.name ?? "" , coordinate: placemark.coordinate)
                }
            }
            if let route{
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        .overlay(alignment: .top){
            TextField("Search for location ..." , text:$searchText)
                .font(.subheadline)
                .padding(12)
                .background(.white)
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .onSubmit(of: .text) {
           // Task{ await searchPlaces() }
        }
        .onChange(of:getDirections , {oldValue , newValue in
            if newValue{
               // fetchRoutes()
            }
            
        })
        .onChange(of: mapSelection, {oldValue , newValue in
               showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails , content: {
            LocationDetailsView(mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        })
        .mapControls{
           MapCompass()
           MapPitchToggle()
           MapUserLocationButton()
        }
   
    }
}
extension UIContentView{
    func searchPlaces() async{
        let request = MKLocalSearch.Request()
        // request.naturalLanguageQuery = searchText
        request.region = .userRegion
        _ = try? await MKLocalSearch(request: request).start()
        //self.results = results?.mapItems ?? []
    }
    func fetchRoute(){
        
    // il ne lit pas les declarations ? ????
      /*  if let mapSelection{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            
            Task{
                let result = try? await MKDirections(request:request).calculate()
              /*  route = result?.routes.first
                routeDestination = mapSelection
                withAnimation(.snappy){
                    routeDisplaying = true
                    showDetails = false
                    if let rect = route?.polyline.boundingMapRect,routeDisplaying{
                        CameraPosition = .rect(rect)
                    }
                }*/
            }
        }*/
    }
}
    

extension CLLocationCoordinate2D{
    static var userLocation:  CLLocationCoordinate2D{
        return.init(latitude: 25.7602 , longitude:-80.1959)
    }
}
extension MKCoordinateRegion{
    static var userRegion : MKCoordinateRegion{
        return.init(center:.userLocation , latitudinalMeters: 10000,longitudinalMeters: 10000 )
    }
}

#Preview {
    map()
}
