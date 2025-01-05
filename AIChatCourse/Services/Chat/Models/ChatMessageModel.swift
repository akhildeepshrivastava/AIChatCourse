//
//  ChatMessageModel.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/4/25.
//
import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    func  hasBenSeenBy(userId: String) -> Bool {
        seenByIds?.contains(userId) ?? false
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "1",
                chatId: "chat_1",
                authorId: "user_1",
                content: "Hello, how are you?",
                seenByIds: ["user_2", "user_3"],
                dateCreated: now.addingTimeInterval(days: -2, hours: -1) // 2 days, 1 hour ago
            ),
            ChatMessageModel(
                id: "2",
                chatId: "chat_1",
                authorId: "user_2",
                content: "I'm good, thanks! How about you?",
                seenByIds: ["user_1", "user_3"],
                dateCreated: now.addingTimeInterval(days: -2, hours: -2) // 2 days, 30 minutes ago
            ),
            ChatMessageModel(
                id: "3",
                chatId: "chat_2",
                authorId: "user_3",
                content: "Don't forget the meeting tomorrow.",
                seenByIds: ["user_1"],
                dateCreated: now.addingTimeInterval(days: -1) // 1 day ago
            ),
            ChatMessageModel(
                id: "4",
                chatId: "chat_3",
                authorId: nil,
                content: "This is a system message.",
                seenByIds: nil,
                dateCreated: now // Current time
            )
        ]
    }
}
