//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterCategory] = CharacterCategory.allCases
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
            }
            .navigationTitle("Categories")
        }
    }
    
    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(item: featuredAvatars) { item in
                    HeroCellView(
                        title: item.name,
                        subTitle: item.characterDescription,
                        imageName: item.profileImageName
                    )
                }
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatar")

        }
    }
    
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(title: category.rawValue.capitalized, imageName: Constants.randomImage)
                        }
                    }
                }
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
        } header: {
            Text("Categories")

        }
    }
}

#Preview {
    ExploreView()
}
