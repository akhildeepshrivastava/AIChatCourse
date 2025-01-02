//
//  OboardingColorView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/31/24.
//

import SwiftUI

struct OboardingColorView: View {
    
    @State private var selectedColor: Color? = nil
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    var body: some View {
        ScrollView {
            colorGrid
                .padding(.horizontal, 24)
        }
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                ZStack {
                    if let selectedColor {
                        ctaButton(
                            selectedColor: selectedColor
                        )
                        .transition(
                            .move(
                                edge: .bottom
                            )
                        )
                    }
                }
                .padding(
                    24
                )
                .background(
                    Color(
                        uiColor: .systemBackground
                    )
                )
            }
        )
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)

    }
    
    private func ctaButton(selectedColor: Color) -> some View {
        
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
    
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay(content: {
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10 : 0)
                                
                            })
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                } header: {
                    Text("Select a profile color")
                        .font(.headline)
                }
                
            }
    }
}

#Preview {
    NavigationStack {
        OboardingColorView()
    }
    .environment(AppState())
}
