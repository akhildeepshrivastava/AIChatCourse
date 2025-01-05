//
//  Untitled.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/1/25.
//

import Foundation

struct AvatarModel: Hashable {
    
    let avatarId: String
    let name: String?
    let characterCategory: CharacterCategory?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterCategory: CharacterCategory? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterCategory = characterCategory
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvatarDescription(avatar: self).characterDescription
    }
    
    static var mock: AvatarModel {
        mocks[0]
    }
    
    static var mocks: [AvatarModel] {
        [
            AvatarModel(avatarId: UUID().uuidString, name: "Alpha", characterCategory: .alien, characterAction: .smiling, characterLocation: .park, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Beta", characterCategory: .dog, characterAction: .eating, characterLocation: .mall, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "Gamma", characterCategory: .cat, characterAction: .shopping, characterLocation: .forest, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avatarId: UUID().uuidString, name: "delta", characterCategory: .woman, characterAction: .relaxing, characterLocation: .museum, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
            
        ]
    }
}

struct AvatarDescription {
    let category: CharacterCategory
    let action: CharacterAction
    let location: CharacterLocation
    
    init(avatar: AvatarModel) {
        self.category = avatar.characterCategory ?? .default
        self.action = avatar.characterAction ?? .default
        self.location = avatar.characterLocation ?? .default
    }
    
    init(category: CharacterCategory, action: CharacterAction, location: CharacterLocation) {
        self.category = category
        self.action = action
        self.location = location
    }
    
    var characterDescription: String {
        let prefix = category.startsWithVowel ? "An" : "A"
        return "\(prefix) \(category.rawValue) that is \(action.rawValue)  in the \(location.rawValue)"
    }
}

enum CharacterCategory: String, CaseIterable, Hashable {
    case man, woman, alien, dog, cat
    
    static var `default`: Self { .man }
    
    var startsWithVowel: Bool {
        switch self {
        case .alien:
            return true
        default:
            return false
        }
    }
}

enum CharacterAction: String {
    case smiling, sittinmg, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
    
    static var `default`: Self { .smiling }
}

enum CharacterLocation: String{
    case park, mall, museum, city, forest, desert, space
    
    static var `default`: Self { .park }

}
