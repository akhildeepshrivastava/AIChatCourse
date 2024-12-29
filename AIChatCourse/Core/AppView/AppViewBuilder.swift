//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/28/24.
//
import SwiftUI

struct AppViewBuilder<TabbarView: View, OnBoardingView: View>: View {

    var showTabBar: Bool = false
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnBoardingView

    var body: some View {
        ZStack {
            if showTabBar {
                tabbarView
                .transition(.move(edge: .trailing))
            } else {
                onboardingView
                .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {

    @State private var showTabBar: Bool = false

    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tab Bar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }

    }
}

 #Preview {
     PreviewView()
 }
