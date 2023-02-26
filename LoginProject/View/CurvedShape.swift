//
//  CurvedShape.swift
//  LoginProject
//
//  Created by Adi Amoyal on 21/02/2023.
//

import SwiftUI

struct CurvedShape: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 70))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 70), radius: 28, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 70))
        }
        .fill(.white)
        .rotationEffect(.init(degrees: 180))
    }
}

struct CurvedShape_Previews: PreviewProvider {
    static var previews: some View {
        CurvedShape()
    }
}
