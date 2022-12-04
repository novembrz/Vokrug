//
//  ProfileView.swift
//  Vokrug
//
//  Created by Kurilova Daria Kirillovna on 04.12.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()    
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                headerView
                infoView
            }
        }
        .background(Color.init(hex: viewModel.user.backgroundColor))
        .ignoresSafeArea()
    }
    
    //MARK: - headerView
    
    var headerView: some View {
        GeometryReader { proxy -> AnyView in
            let minY = viewModel.findMinYForOffset(proxy)
            
            return AnyView (
                ZStack {
                    if let cover = viewModel.user.cover {
                        Image(cover)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width,
                                   height: minY > 0 ? .coverHeight + minY : .coverHeight, alignment: .center)
                            .cornerRadius(0)
                        
                        BlurView()
                            .opacity(viewModel.blurViewOpacity())
                    }

                    scrollBarView
                }
                    .clipped()
                    .frame(height: minY > 0 ? .coverHeight + minY : nil)
                    .offset(y: minY > 0 ? -minY : -minY < .coverOffset ? 0 : -minY - .coverOffset)
            )
        }
        .frame(height: .coverHeight)
        .zIndex(1)
    }
    
    //MARK: - scrollBarView
    
    var scrollBarView: some View {
        HStack(spacing: 18) {
            Image(systemName: .chevron)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .fontWeight(.bold)
                .frame(height: 20)
                .foregroundColor(viewModel.textColor())
            
            Text(viewModel.user.username)
                .foregroundColor(viewModel.textColor())
                .font(.semiBold(16))
            
            Spacer()
            
            HStack(spacing: 9) {
                subscribeButton
                searchButton(height: 30)
            }
        }
        .padding(.horizontal, 16)
        .offset(y: 120)
        //.offset(y: 140)
        .offset(y: viewModel.titleOffset > 100 ? 0 : -viewModel.getTitleTextOffset())
        .opacity(viewModel.titleOffset < 100 ? 1 : 0)
    }
    
    var subscribeButton: some View {
        Group {
            if viewModel.user.isSubscribe {
                SmallSpecialButton(
                    icon: Image.Icon.subUserFill(),
                    color: viewModel.textColor(),
                    size: 30) {
                        print("🐸", "Search")
                    }
            } else {
                SmallBorderButton(
                    icon: Image.Icon.unsubUser(),
                    color: viewModel.textColor(),
                    imageSize: 11,
                    circleSize: 30) {
                        print("💔", "you are unsubscribe")
                    }
            }
        }
    }
    
    @ViewBuilder
    func searchButton(height: CGFloat) -> some View {
        SmallSpecialButton(
            icon: Image.Icon.search(),
            color: viewModel.textColor(),
            size: height) {
                print("🐸", "Search")
            }
    }
    
    //MARK: - infoView
    
    var infoView: some View {
        VStack {
            avatarView
            profileData
            Rectangle()
                .foregroundColor(.init(hex: viewModel.user.separatorColor))
                .frame(height: 11)
            segmentedMenu
            contentView(viewModel.currentTab)
        }
        .zIndex(-viewModel.offset > 80 ? 0 : 1)
        //.zIndex(-viewModel.offset > 120 ? 0 : 1) // hz x
    }
    
    var avatarView: some View {
        Group {
            if let avatar = viewModel.user.avatar {
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 110)
                    .clipShape(Circle())
                    .padding(2)
                    .background(
                        viewModel.textColor()
                    )
                    .clipShape(Circle())
                    .offset(y: viewModel.offset < 0 ? viewModel.getOffset() - 20 : -20)
                    //.offset(y: viewModel.offset < 0 ? viewModel.getOffset() - 70 : -70)
                    .scaleEffect(viewModel.getScale())
                    .padding(.top, -25)
                    .padding(.bottom, -20)
                    //.padding(.top, -25)
                    //.padding(.bottom, -70)
            }
        }
    }
    
    //MARK: - profileData
    
    var profileData: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 4) {
                if let text = viewModel.user.title.text {
                    Text(text)
                        .font(.bold(40))
                    //.font(.getFont(viewModel.user.title.font, size: 40))
                        .foregroundColor(.init(hex: viewModel.user.title.color))
                }
                
                if let description = viewModel.user.description {
                    Text(description)
                        .font(.regular(20))
                        .foregroundColor(.init(hex: viewModel.user.title.color))
                }
            }
            
            if viewModel.user.isSubscribe {
                buttonsForSubscribeUsers
            } else {
                buttonsForUnsubscribeUsers
            }
        }
        .padding(.horizontal, 16)
        .overlay(
            GeometryReader { proxy -> Color in
                viewModel.findMinYForTitleOffset(proxy)
                return Color.clear
            }
            .frame(width: 0, height: 0)
            ,alignment: .top
        )
    }
    
    //MARK: - Buttons
    
    var buttonsForSubscribeUsers: some View {
        Group {
            if viewModel.user.allowMessages {
                HStack(spacing: 9) {
                    BigButton(
                        text: .message,
                        icon: Image.Icon.message(),
                        color: .init(hex: viewModel.user.actionColor)) {
                            print("💔", "message")
                        }
                    
                    SmallButton(
                        icon: Image.Icon.subUser(),
                        color: .init(hex: viewModel.user.actionColor)) {
                            print("💔", "you are unsubscribe")
                        }
                    
                    moreButton
                }
            } else {
                HStack(spacing: 9) {
                    BigButton(
                        text: .unsubscribe,
                        icon: Image.Icon.subUser(),
                        color: .init(hex: viewModel.user.actionColor)) {
                            print("💔", "you are unsubscribe")
                        }
                    
                    moreButton
                }
            }
        }
    }
    
    var buttonsForUnsubscribeUsers: some View {
        HStack(spacing: 9) {
            BigButton(
                text: .subscribe,
                icon: Image.Icon.unsubUser(),
                color: .init(hex: viewModel.user.actionColor)) {
                    print("💔", "you are subscribe")
                }
            
            if viewModel.user.allowMessages {
                SmallButton(
                    icon: Image.Icon.message(),
                    color: .init(hex: viewModel.user.actionColor)) {
                        print("💔", "message")
                    }
            }
            
            moreButton
        }
    }
    
    var moreButton: some View {
        SmallButton(
            icon: Image.Icon.more(),
            color: .init(hex: viewModel.user.actionColor)) {
                print("💔", "more")
            }
    }
    
    //MARK: - segmentedMenu
    
    var segmentedMenu: some View {
        Group {
            if viewModel.user.segments.count > 1 {
                VStack (spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 0) {
                            ForEach(viewModel.user.segments, id: \.self) { segment in
                                TabButtonView(title: segment, currentTab: $viewModel.currentTab, animation: animation)
                            }
                        }
                        .animation(.spring(), value: viewModel.currentTab)
                    }
                    
                    Divider()
                }
                .padding(.top, 20)
                .background(Color(hex: viewModel.user.backgroundColor))
                .offset(y: viewModel.tabBarOffset < 90 ? -viewModel.tabBarOffset + 90 : 0)
                .overlay(
                    GeometryReader { proxy -> Color in
                        viewModel.findMinYForTabBaOffset(proxy)
                        return Color.clear
                    }
                        .frame(width: 0, height: 0)
                    ,alignment: .top
                )
                .zIndex(1)
            }
        }
    }
    
    //MARK: - feedView
    
    @ViewBuilder
    func contentView(_ tab: Segment) -> some View {
        switch tab {
        case .feed:
            feedView
        case .environment:
            Text("environment")
        case .saved:
            Text("saved")
        case .music:
            Text("music")
        }
    }
    
    var feedView: some View {
        VStack(spacing: 18) {
            ForEach(1...10, id: \.self) { _ in
                Rectangle()
                    .frame(height: 50)
                Divider()
            }
        }
        .padding(.top)
        .zIndex(0)
    }
}

//MARK: - Extensions

private extension String {
    static let chevron = "chevron.left"
    static let subscribe = "Подписаться"
    static let unsubscribe = "Отписаться"
    static let message = "Сообщение"
}

private extension CGFloat {
    static let coverHeight: CGFloat = 180//220 //ex 180
    static let coverOffset: CGFloat = 80//120 //ex 80
}

//MARK: - Previews

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
