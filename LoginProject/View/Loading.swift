//
//  Loading.swift
//  LoginProject
//
//  Created by Adi Amoyal on 19/02/2023.
//

import SwiftUI

struct Loading: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            if show {
                Group {
                    Rectangle()
                        .fill(.black.opacity(0.25))
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .padding(15)
                        .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: show)
    }
}

//struct Loading_Previews: PreviewProvider {
//    static var previews: some View {
//        Loading()
//    }
//}
