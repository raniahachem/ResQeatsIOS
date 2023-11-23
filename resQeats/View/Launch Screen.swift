//
//  Launch Screen.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 07/11/2023.
//

import SwiftUI

struct Launch_Screen: View {
    @State private var showingSheet = false
    var body: some View {
        Image("splashscreen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            
        Button("Next") {
            showingSheet.toggle()
            
        }
        .sheet(isPresented: $showingSheet) {
                    Screen1()
     }.foregroundColor(.red)
            .frame(width: 255 , height: 55)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:95 , y:77)
            .font(.system(size: 19))
            .offset(x:-100 , y:-75)
            
        
    }
}


#Preview {
    Launch_Screen()
}
