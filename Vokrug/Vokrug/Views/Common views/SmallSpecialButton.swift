//
//  SmallSpecialButton.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct SmallSpecialButton: View {
    var icon: Image
    var color: Color? = .white //TODO: user textColor
    var size: CGFloat? = 41
    
    var completion: (() -> ())
    
    var body: some View {
        Button {
            withAnimation {
                completion()
            }
        } label: {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .fontWeight(.bold)
                .frame(height: size)
                .foregroundColor(color)
        }
    }
}

struct SmallSpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallSpecialButton(icon: Image.Icon.search(), color: .red) {
            print("💔")
        }
    }
}
