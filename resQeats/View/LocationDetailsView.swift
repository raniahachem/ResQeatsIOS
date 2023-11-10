//
//  LocationDetailsView.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @Binding var mapSelection:MKMapItem?
    @Binding var show :Bool
    @State private var lookAroundScene: MKLookAroundScene?
    @Binding var getDirections: Bool
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(mapSelection?.placemark.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    Text(mapSelection?.placemark.title ?? "")
                        .foregroundColor(.gray)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                }
                Spacer()
                
                Button {
                    show.toggle()
                    mapSelection = nil
                }
            label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 24 , height: 24)
                    .foregroundStyle(.gray , Color(.systemGray6))
            }
            }
            
            if let scene = lookAroundScene{
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding()
            }
            else{
                ContentUnavailableView("No preview is available" ,systemImage: "eye.slah")
            }
            
            HStack(spacing:24){
            
                Button("button") {
                    if let mapSelection{
                        mapSelection.openInMaps()
                }
                Label:do {
                    Text("open in Maps")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170 , height:48)
                        .background(.green)
                        .cornerRadius(10)
                }
                    Button{
                        getDirections = true
                        show = false
                    }
                label:{
                    Text("Get directions")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170 , height: 48)
                        .background(.blue)
                        .cornerRadius(12)
                    
                }
                }
                .padding()
            }
            
        }
        .onAppear{
            print("Debug: Did call on appear ")
            fetchLookAroundPreview()
        }
        .onChange(of: mapSelection){ oldValue , newValue in
            print("Did call on appear ")
                fetchLookAroundPreview()
        }.padding()
    }
}
extension LocationDetailsView{
    func fetchLookAroundPreview(){
        lookAroundScene = nil
        Task{
            let request = MKLookAroundSceneRequest(mapItem: mapSelection!)
            lookAroundScene = try? await request.scene
        }
    }
}

#Preview {
    LocationDetailsView(mapSelection: .constant(nil), show: .constant(false), getDirections: .constant(false))
}
