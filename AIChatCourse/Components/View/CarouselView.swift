//
//  CarouselView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/2/25.
//

import SwiftUI

struct CarouselView<Content: View, T: Hashable>: View {
    
    var item: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?
    
    var body: some View {
        VStack(spacing: 12) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(item, id: \.self) { item in
                        content(item)
                            .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.9)
                            })
                            .containerRelativeFrame(.horizontal, alignment: .center)
                            .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: item.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear() {
                updateSelectionIfNeeded()
            }
            
            HStack(spacing: 8) {
                ForEach(item, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? Color.accentColor : Color.secondary.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == item.last {
            selection = item.first
        }
    }
}

#Preview {
    
    CarouselView(item: AvatarModel.mocks) { item in
        HeroCellView(
            title: item.name,
            subTitle: item.characterDescription,
            imageName: item.profileImageName
        )
    }
    .padding()
}