//
//  BigButton.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct BigButton: View {
    var text: String
    var icon: Image?
    var color: Color
    var imageSize: CGFloat? = 15
    var height: CGFloat? = 41
    var width: CGFloat? = 227
    
    var completion: (() -> ())
    
    var body: some View {
        Button {
            withAnimation {
                completion()
            }
        } label: {
            ZStack {
                Capsule()
                    .background(Circle())
                    .frame(width: width, height: height)
                
                HStack(spacing: 9) {
                    if icon != nil {
                        icon!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .foregroundColor(.whiteColor())
                    }
                    
                    Text(text)
                        .font(.regular(16))
                        .foregroundColor(.whiteColor())
                }
            }
        }
        .foregroundColor(color)
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(text: "asd", icon: Image.Icon.message(), color: .red) {}
    }
}
