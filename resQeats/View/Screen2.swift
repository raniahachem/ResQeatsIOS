//
//  Screen2.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 10/11/2023.
//

import SwiftUI

struct Screen2: View {
    var body: some View {
        ZStack{
            (Color.white).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            VStack{
                Image("ima")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                    .frame(width: 10,height: 350)
                    .offset(x:0,y:-35)

            }
              
            
               VStack{
                Label("Dscover savor delicious plates", systemImage: "")
                    .padding([.top, .leading], 0.0)
                    .frame(height: 0.0)
                    .bold()
                    .font(.title3)
                    .offset(x:5 ,y:19)
                
                
            }
            VStack{
                Label("Explore a world of flavor with affordable surplus meals", systemImage: "")
                    .frame(width: 300.0, height: 2.0)
                    .accessibilityElement(children: /*@START_MENU_TOKEN@*/.contain/*@END_MENU_TOKEN@*/)
                    .padding(.top, 180.0)
                    .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 9))
            }
            VStack{
                Button("Next"){
                    
                }
                .foregroundColor(.red)
                .frame(width: 255 , height: 55)
                .background(Color.green)
                .cornerRadius(10)
                .offset(x:95 , y:77)
                .font(.system(size: 19))
                .offset(x:-90 , y:95)
                
                
                
            }

        }
    }
}

#Preview {
    Screen2()
}
