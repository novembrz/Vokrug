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
            avatarShape: .circle,
            isAvatarVisible: true,
            cover: "cover",
            textColor: .dark,
            navButtonColor: .white,
            backgroundColor: "BFC2FF",
            separatorColor: "9FA3E2",
            segments: [.posts, .environment, .saved, .music],
            topicFolders: [TopicFolder(title: "Мои работы", coverUrl: "person"), TopicFolder(title: "Туториалы", coverUrl: "person"), TopicFolder(title: "Материалы", coverUrl: "person")],
            isTopicFoldersVisible: true
        )
        
        @Published var currentTab: Segment = .posts
        @Published var offset: CGFloat = 0
        @Published var tabBarOffset: CGFloat = 0
        @Published var titleOffset: CGFloat = 0
        
        func avatarShape() -> any Shape {
            switch user.avatarShape {
            case .circle:
                return Circle()
            case .rectangle:
                return Rectangle()
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
