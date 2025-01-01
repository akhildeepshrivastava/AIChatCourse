//
//  Onboarding IntroView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/31/24.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("avatars ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with them!\n\nHave ")
                +
                Text("real conversations ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("with AI generated response.")
            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(24)
            
            NavigationLink {
                OboardingColorView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .font(.title3)
        .padding(24)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
