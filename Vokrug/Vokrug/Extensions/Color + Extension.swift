//
//  Color + Extension.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

extension Color {
    
    static func globalColor() -> Color { //TODO: USERDEFAULTS
        return .white
    }
    
    static func textColor() -> Color {
        return Color("TextColor")
    }
    
    static func whiteColor() -> Color {
        return .white
    }
}
