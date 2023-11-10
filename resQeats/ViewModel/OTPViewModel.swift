//
//  OTPViewModel.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 10/11/2023.
//

import SwiftUI

class OTPViewModel: ObservableObject{
    @Published var otpText:String = ""
    @Published var otpFields:[String] = Array(repeating: "" , count: 6)
}
