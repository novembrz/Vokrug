//
//  Font + Extension.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

extension Font {
    
    static func getFont(_ fontName: User.TextFont, size: CGFloat) -> Font {
        switch fontName {
        case .damascus:
            return Font.custom("Damascus", size: size).weight(.black)
        }
    }
    
    static func light(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Light", size: size)
    }
    
    static func regular(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", size: size)
    }
    
    static func semiBold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-SemiBold", size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", size: size)
    }
}
