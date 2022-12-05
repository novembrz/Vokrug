//
//  TopicFolderView.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 05.12.2022.
//

import SwiftUI

struct TopicFoldersView: View {
    var title: String?
    var folders: [TopicFolder]
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            if let title = title {
                Text(title)
                    .foregroundColor(.globalColor())
                    .font(.bold(.titleSize))
                    .padding(.horizontal, .Constants.horizontalPadding)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .Constants.spacing) {
                    ForEach(folders, id: \.self) { folder in
                        Button {
                            withAnimation {
                                // transition
                            }
                        } label: {
                            VStack(alignment: .leading, spacing: .elementSpacing) {
                                Image(folder.coverUrl)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: .width, height: .height)
                                    .cornerRadius(.Constants.cornerRadius)
                                
                                Text(folder.title)
                                    .font(.semiBold(.textSize))
                                    .foregroundColor(.globalColor())
                            }
                        }
                    }
                }
                .padding(.horizontal, .Constants.horizontalPadding)
            }
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let spacing: CGFloat = 12
    static let elementSpacing: CGFloat = 6
    static let width: CGFloat = 137
    static let height: CGFloat = 70
    static let titleSize: CGFloat = 25
    static let textSize: CGFloat = 15
}

//MARK: - Previews

struct TopicFolderView_Previews: PreviewProvider {
    static var previews: some View {
        TopicFoldersView(title: "Избранное", folders: [TopicFolder(title: "Мои работы", coverUrl: "person"), TopicFolder(title: "Туториалы", coverUrl: "person"), TopicFolder(title: "Материалы", coverUrl: "person")])
    }
}
