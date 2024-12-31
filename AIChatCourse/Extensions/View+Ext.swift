//
//  Untitled.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
}
