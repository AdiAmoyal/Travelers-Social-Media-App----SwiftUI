//
//  Home.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Home page")
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(AuthViewModel())
    }
}
