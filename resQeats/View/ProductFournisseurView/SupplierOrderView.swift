//
//  SupplierOrderView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct SupplierOrderView: View {
    var body: some View {
        NavigationView {
         Text("My orders")
                .navigationTitle("Orders received")
        }
    }
}

struct SupplierOrderView_Previews: PreviewProvider {
    static var previews: some View {
        SupplierOrderView()
    }
}
