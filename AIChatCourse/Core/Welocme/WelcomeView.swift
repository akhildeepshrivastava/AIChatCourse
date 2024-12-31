//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var imageName: String = Constants.randomImage
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaAction
                    .padding(16)
                
                policyLinks
            }
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 👍")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Youtube @ SwiftUIThinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var ctaAction: some View {
        VStack(spacing: 8) {
            
            NavigationLink {
                OnboardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Login!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfService)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicy)!) {
                Text("Privacy policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
