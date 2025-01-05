//
//  ChatRowCellViewBuilder.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getlastChatMessage: () async -> ChatMessageModel?

    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false

    private var isLoading: Bool {
        !(didLoadAvatar && didLoadChatMessage)
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBenSeenBy(userId: currentUserId)
    }
    
    private var subHeadLine: String? {
        if isLoading{
          return "xxxx xxxxxx xxx x x x"
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error loading data."
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            headline: isLoading ? "xxxx xxxxxx" : avatar?.name,
            imageName: avatar?.profileImageName,
            subHdadline: subHeadLine,
            hasNewChat: hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            lastChatMessage = await getlastChatMessage()
            didLoadChatMessage = true
        }
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
    }
    
   
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }, getlastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        })
        
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            return .mock
        }, getlastChatMessage: {
            return .mock
        })
        
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            return nil
        }, getlastChatMessage: {
            return nil
        })
    }
    
    
}
