//
//  ChatModel.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//
import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
        
    static var mocks: [ChatModel] {
        let now = Date()
        return [
            ChatModel(
                id: "mock_chat_1",
                userId: "user_1",
                avatarId: "avatar_1",
                dateCreated: now.addingTimeInterval(days: -7), // 7 days ago
                dateModified: now.addingTimeInterval(days: -6) // 6 days ago
            ),
            ChatModel(
                id: "mock_chat_2",
                userId: "user_2",
                avatarId: "avatar_2",
                dateCreated: now.addingTimeInterval(days: -5), // 5 days ago
                dateModified: now.addingTimeInterval(days: -4) // 4 days ago
            ),
            ChatModel(
                id: "mock_chat_3",
                userId: "user_3",
                avatarId: "avatar_3",
                dateCreated: now.addingTimeInterval(days: -3), // 3 days ago
                dateModified: now.addingTimeInterval(days: -2) // 2 days ago
            ),
            ChatModel(
                id: "mock_chat_4",
                userId: "user_4",
                avatarId: "avatar_4",
                dateCreated: now.addingTimeInterval(days: -1), // 1 day ago
                dateModified: now // Today
            )
        ]
    }
}
