//
//  ProfileViewModel.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 04.12.2022.
//

import SwiftUI

extension ProfileView {
    @MainActor class ProfileViewModel: ObservableObject {
        
        @Published var user = User(
            username: "anna_ignatova",
            title: User.Title(text: "ANNUSHKA", font: .damascus, color: "000000"),
            description: "I think that I’m a photographer",
            actionColor: "C31313",
            allowMessages: true,
            isSubscribe: false,
            avatar: "person",
            cover: "cover",
            textColor: .white,
            backgroundColor: "BFC2FF",
            separatorColor: "9FA3E2",
            segments: [.feed, .environment, .saved, .music]
        )
        
        @Published var currentTab: Segment = .feed
        @Published var offset: CGFloat = 0
        @Published var tabBarOffset: CGFloat = 0
        @Published var titleOffset: CGFloat = 0
        
        func textColor() -> Color {
            switch user.textColor {
            case .dark:
                return .black
            case .white:
                return .white
            }
        }

        func findMinYForOffset(_ proxy: GeometryProxy) -> CGFloat {
            let minY = proxy.frame(in: .global).minY

            DispatchQueue.main.async {
               self.offset = minY
            }
            return minY
        }

        func findMinYForTitleOffset(_ proxy: GeometryProxy) {
            let minY = proxy.frame(in: .global).minY
            
            DispatchQueue.main.async {
                self.titleOffset = minY
            }
        }
        
        func findMinYForTabBaOffset(_ proxy: GeometryProxy) {
            let minY = proxy.frame(in: .global).minY
            
            DispatchQueue.main.async {
                self.tabBarOffset = minY
            }
        }

        func getTitleTextOffset() -> CGFloat {
            let progress = 20 / titleOffset
            let offset = 60 * (progress > 0  && progress <= 1 ? progress : 1)
            return offset
        }

        func getOffset() -> CGFloat {
            let progress = (-offset / 80) * 20
            return progress < 20 ? progress : 20
        }
        
        func getScale() -> CGFloat {
            let progress = -offset / 80
            let scale = 1.8 - (progress < 1.0 ? progress : 1)
            return scale < 1 ? scale : 1
        }
        
        func blurViewOpacity() -> Double {
            let progress  = -(offset + 80) / 150
            return Double(-offset > 80 ? progress : 0)
        }
    }
}
