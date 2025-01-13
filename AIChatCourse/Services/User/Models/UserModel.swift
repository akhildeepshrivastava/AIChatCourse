//
//  UserModel.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/8/25.
//

import SwiftUI

struct UserModel {
    let userId: String?
    let dateCreated: Date?
    let didCompleterOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String? = nil,
        dateCreated: Date? = nil,
        didCompleterOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleterOnboarding = didCompleterOnboarding
        self.profileColorHex = profileColorHex
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    var profileColor: Color {
        profileColorHex == nil  ? .accent : .init(hex: profileColorHex!)
    }
    
    static var mocks: [Self] {
        let now = Date()
        return [
            UserModel(
                userId: "user_1",
                dateCreated: now.addingTimeInterval(days: -10), // 10 days ago
                didCompleterOnboarding: true,
                profileColorHex: "#3357FF" // Orange-red color
            ),
            UserModel(
                userId: "user_2",
                dateCreated: now.addingTimeInterval(days: -8), // 8 days ago
                didCompleterOnboarding: false,
                profileColorHex: "#33FF57" // Green color
            ),
            UserModel(
                userId: "user_3",
                dateCreated: now.addingTimeInterval(days: -5), // 5 days ago
                didCompleterOnboarding: true,
                profileColorHex: "#FF5733" // Blue color
            ),
            UserModel(
                userId: nil,
                dateCreated: nil,
                didCompleterOnboarding: nil,
                profileColorHex: "#000000" // Black color
            )
        ]
    }
}

