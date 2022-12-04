//
//  Image + Extension.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

extension Image {
    
    struct Icon {
        static func search() -> Image {
            return Image("search")
        }
        
        static func message() -> Image {
            return Image("message")
        }
        
        static func more() -> Image {
            return Image("more")
        }
        
        static func subUser() -> Image {
            return Image("subUser")
        }
        
        static func subUserFill() -> Image {
            return Image("subUser.fill")
        }
        
        static func unsubUser() -> Image {
            return Image("unsubUser")
        }
    }
    
    struct Mock {
        static func cover() -> Image {
            return Image("cover")
        }
        
        static func person() -> Image {
            return Image("person")
        }
    }
}
