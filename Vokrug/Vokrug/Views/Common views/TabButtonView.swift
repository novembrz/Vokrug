//
//  TabButtonView.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import SwiftUI

struct TabButtonView: View {
    var title: Segment
    var actionColor: Color = .init(hex: "C31313") //кэш
    
    @Binding var currentTab: Segment
    
    var animation: Namespace.ID
    
    var body: some View {
        LazyVStack(spacing: 6) {
            Text(title.rawValue)
                .font(.semiBold(16))
                .foregroundColor(currentTab == title ? actionColor : .whiteColor())
                .padding(.horizontal)
            
            if currentTab == title {
                Capsule()
                    .fill(actionColor)
                    .frame(height: 1.6)
                    .matchedGeometryEffect(id: "TAB", in: animation)
            } else {
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 1.6)
            }
        }
        .onTapGesture {
            withAnimation {
                currentTab = title
            }
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
