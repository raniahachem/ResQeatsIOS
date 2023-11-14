//
//  SendPassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 10/11/2023.
//

import SwiftUI


struct sendpassword: View {
    @StateObject var otpModel: OTPViewModel = .init()
   
    @FocusState var activeField : OTPField?
    var body: some View {
        VStack{
            OTPField()
          
        }
        .padding()
        .frame(height: .infinity , alignment: .top)
        .offset(x:0 , y:200)
        VStack{
            Text("Please check your mobile number")
            Text("continue to reset your password")
        }
        .padding()
        .frame(width: 300 , height: 50)
        .background(Color.black.opacity(0))
        .frame(width: 1200 , height: 150)
        .cornerRadius(10)
        .offset(x:1 , y:-130)
        .opacity(0.35)
        .font(.system(size: 10))
        
        
        
        VStack{
            Text("Verification")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .offset(x:0, y:-290)
            
        }
        VStack{
            Button("Next"){
                
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:2 , y:15)
        }
        VStack{
            Text("Didn't receive?")
           

        }
        .padding()
        .frame(width: 300 , height: 50)
        .background(Color.black.opacity(0))
        .frame(width: 1200 , height: 150)
        .cornerRadius(10)
        .offset(x:1 , y:-280)
        .opacity(0.95)
        .font(.system(size: 12))
        .offset(x: -50, y:250)
        VStack{
            Button("ClickHere?") {
                
            }
            .offset(x:35 , y:-118)
            .frame(width: 100 , height: 12)
            .foregroundColor(.red)
            .font(.system(size: 12))
            
            
        }
        
       
    }
    
    //Custom OTP Field
    func OTPField() -> some View{
        HStack(spacing:14){
            ForEach(0..<6 , id:\.self) { index in
                VStack(spacing:8){
                    TextField("",text: $otpModel.otpFields[index])
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                    Rectangle()
                        .frame(height: 4)
                    
                }
                .frame(width: 40)
                
            }
        }
    }
  /*  func activeStateForIndex(index:Int) ->OTPField{
        switch index {
        case 0:
            return .field1
        case 1:
            return .field2
        case 2:
            return .field3
        case 3:
            return .field4
        default:
            return .field6
        }
    }*/
    
}

#Preview {
    sendpassword()
}

//Focus state Enum

enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
