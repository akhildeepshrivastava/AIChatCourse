//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    var body: some View {
        NavigationStack {
            List{
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // FIXME: Add Guid
                        chat: chat) {
                            try? await Task.sleep(for: .seconds(5))
                            return .mock
                        } getlastChatMessage: {
                            try? await Task.sleep(for: .seconds(5))
                            return .mock
                        }
                        .anyButton(.highlight) {
                            
                        }
                }
                .removeListRowFormatting()
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}

