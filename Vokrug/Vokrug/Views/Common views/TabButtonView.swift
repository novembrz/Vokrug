//
//  TabButtonView.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct TabButtonView: View {
    var title: Segment
    var actionColor: Color = .init(hex: "C31313") //TODO: userDefaults
    
    @Binding var currentTab: Segment
    
    var animation: Namespace.ID
    
    var body: some View {
        LazyVStack(spacing: .spacing) {
            Text(title.rawValue)
                .font(.semiBold(.textSize))
                .foregroundColor(currentTab == title ? actionColor : .whiteColor())
                .padding(.horizontal)
            
            if currentTab == title {
                Capsule()
                    .fill(actionColor)
                    .frame(height: .capsuleHeight)
                    .matchedGeometryEffect(id: String.geometryId, in: animation)
            } else {
                Capsule()
                    .fill(Color.clear)
                    .frame(height: .capsuleHeight)
            }
        }
        .onTapGesture {
            withAnimation {
                currentTab = title
            }
        }
    }
}

//MARK: - Extensions

private extension String {
    static let geometryId = "TAB"
}

private extension CGFloat {
    static let spacing: CGFloat = 6
    static let textSize: CGFloat = 16
    static let capsuleHeight: CGFloat = 1.6
}

//MARK: - Previews

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
