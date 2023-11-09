//
//  sendpassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI


struct sendpassword: View {
    var body: some View {
        VStack{
            OTPField()
            
        }
        .padding()
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , alignment: .top )
        .navigationTitle("verification")
    }
    //MArk:Custom OTP Field
    @ViewBuilder
    func OTPField()-> some View{
        HStack (spacing : 14){
            ForEach(0..<6 , id:\.self){index in
                VStack(spacing : 8){
                    
                }
            }
        }
    }
}

#Preview {
    sendpassword()
}
