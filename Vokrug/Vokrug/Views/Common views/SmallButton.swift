//
//  SmallFillButton.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct SmallButton: View {
    var icon: Image
    var color: Color
    var imageSize: CGFloat? = 15
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
                    .background(Circle())
                
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: imageSize)
                    .foregroundColor(.whiteColor())
            }
            .frame(width: circleSize, height: circleSize)
        }
        .foregroundColor(color)
    }
}

struct SmallFillButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(icon: Image.Icon.message(), color: .red) {}
    }
}
