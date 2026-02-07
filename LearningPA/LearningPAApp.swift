//
//  LearningPAApp.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 06/02/2026.
//

import SwiftUI


@main
struct LearningPAApp: App {
    @State private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(userData)
        }
    }
}

