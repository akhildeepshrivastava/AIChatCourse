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

    @AppStorage("showTabBar") var showTabBar: Bool = false

    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

 #Preview("AppView - Tabbar") {
     AppView(showTabBar: true)
 }

#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
