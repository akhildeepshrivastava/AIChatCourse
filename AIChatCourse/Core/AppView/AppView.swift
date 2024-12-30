//
//  AppView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/28/24.
//

import SwiftUI

// tabbar - signed in
// onboarding - signd out



struct AppView: View {

    @State var appState: AppState = .init()
    

    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

 #Preview("AppView - Tabbar") {
     AppView(appState: AppState(showTabBar: true))
 }

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
