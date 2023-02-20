//
//  Corners.swift
//  LoginProject
//
//  Created by Adi Amoyal on 20/02/2023.
//

import SwiftUI

struct Corners : Shape {
    var corner : UIRectCorner
    var size : CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        return Path(path.cgPath)
    }
}
