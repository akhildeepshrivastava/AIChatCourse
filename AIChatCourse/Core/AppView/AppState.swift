//
//  AppState.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 12/29/24.
//
import SwiftUI

@Observable
class AppState {
    private(set )var showTabBar: Bool {
        didSet {
            UserDefaults.standard.set(showTabBar, forKey: "showTabBarView")
        }
    }
    
    init(showTabBar: Bool = UserDefaults.standard.bool(forKey: "showTabBarView")) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
    
}

extension UserDefaults {
    
    private struct Keys {
        static let showTabBarView = "showTabBarView"
    }
    static var showTabBarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabBarView)
        } set {
            standard.set(newValue, forKey: Keys.showTabBarView)
        }
    }
}
