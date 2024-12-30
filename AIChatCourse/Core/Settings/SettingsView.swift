//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    signOut()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func signOut() {
        //dp some login to signout user form app
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    SettingsView()
}
