//
//  loginCreateAccount.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI

struct loginCreateAccount: View {
    var body: some View {
        ZStack{
            (Color.green).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Image("image4")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                    .frame(width: -55,height: 120)
                    .offset(x:2,y:-372)
                
               

            }
            .frame(
                minWidth: 0,
                maxWidth:391,
                minHeight: 55,
                maxHeight: 530,
                alignment: .bottom
            )
            .ignoresSafeArea(.all)
            .background(Color.white)
            .offset(CGSize(width: -10, height:180.0))
            .offset(CGSize(width: 10.0, height: 10.0))

            
            Label("Dicover incredible surplus meals from a wide range of restaurents available for you ay unbeatble prices ", systemImage: "")
                .padding(.top, 140.0)
                .frame(width: 300.0, height: 366.0)
                .accessibilityElement(children: .contain)
                .padding(.top, 180.0)
                .accessibilityLabel("Label")
                .font(.system(size: 9))
                .offset(x:-5,y:-79)
                .opacity(0.5)
                .brightness(0.005)
            VStack(alignment: .center){
                Button("login") {
                    
                }
                .foregroundColor(.white)
                .padding(.top, 1060.0)
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .contrast(333)
                .buttonStyle(.borderedProminent)
                .frame(width: 2222.0, height: 38)
                .controlSize(.extraLarge)
                Spacer()
                
                Button("Create an Account") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.top, -160.0)
                .foregroundColor(.white)
                
                .buttonStyle(.borderedProminent)
                .tint(Color.green)
                .contrast(333)
                .buttonStyle(.borderedProminent)
                .frame(width: 222.0, height: 38)
                .controlSize(.extraLarge)

            }
          
            
        }
        
        
        

    }
}

#Preview {
    loginCreateAccount()
}
