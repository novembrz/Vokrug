//
//  User.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 03.12.2022.
//

import Foundation

struct User: Decodable {
    let username: String
    let title: Title
    let description: String?
    let actionColor: String
    let allowMessages: Bool
    let isSubscribe: Bool
    
    let avatar: String
    let avatarShape: AvatarShape
    let isAvatarVisible: Bool
    
    let cover: String?
    let textColor: TextColor
    let navButtonColor: TextColor
    let backgroundColor: String
    let separatorColor: String
    let segments: [Segment]
    
    let topicFolders: [TopicFolder]
    let isTopicFoldersVisible: Bool
    
    struct Title: Decodable {
        let text: String?
        let font: TextFont
        let color: String
    }
    
    enum AvatarShape: Decodable {
        case circle, rectangle
    }
    
    enum TextColor: Decodable {
        case dark, white
    }
    
    enum TextFont: Decodable {
        case damascus
    }
}

enum Segment: String, Equatable, Decodable {
    case posts = "Посты"
    case environment = "Окружение"
    case saved = "Сохранено"
    case music = "Музыка"
}
