//
//  Screen3.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI

struct Screen3: View {
    var body: some View {
        ZStack{
            (Color.gray).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            Image("image3")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                .frame(width: 55,height: 250)
                .offset(x:0,y:-92)

            
          
            
            
            Label("Make difference", systemImage: "")
                .padding([.top, .leading], 0.0)
                .frame(height: 44.0)
                .bold()
                .font(.title3)
            
            Label("Be part of the mouvement to help fight hunger worldwide", systemImage: "")
                .frame(width: 300.0, height: 2.0)
                .accessibilityElement(children: .contain)
                .padding(.top, 180.0)
                .accessibilityLabel("Label")
                .font(.system(size: 9))
            Button("Next") {
                
            }
            .padding(.top, 290.0)
            .contrast(17)
            .buttonStyle(.borderedProminent)

            
        }
    }
}

#Preview {
    Screen3()
}
