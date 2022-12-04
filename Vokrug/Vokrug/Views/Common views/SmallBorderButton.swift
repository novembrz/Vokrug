//
//  SmallButton.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct SmallBorderButton: View {
    var icon: Image
    var color: Color? = .white //TODO: user textColor
    var imageSize: CGFloat? = 16
    var circleSize: CGFloat? = 41
    
    var completion: (() -> ())
    
    var body: some View {
        Button {
            withAnimation {
                completion()
            }
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(color!, lineWidth: 1.5)
                
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: imageSize)
                    .foregroundColor(color)
            }
            .frame(width: circleSize, height: circleSize)
        }
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallBorderButton(icon: Image.Icon.unsubUser(), color: .red) {}
    }
}
