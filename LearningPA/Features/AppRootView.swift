//
//  AppRootView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI

struct AppRootView: View {
    
    // MARK: Properties
    @State private var route: AppRoutes = .splash
   @Environment(UserData.self) private var userData
    
    var body: some View {
        Group {
            switch route {
            case .splash:
                SplashView(route: $route)
            case .signin:
                SigninView(route: $route)
            case .dashbaord:
                NavigationStack {
                    DashboardView()
                }
            }
        }
        .onAppear {
            if AppStore.shared.seenSplashView {
                guard let cachedUserDate = AppStore.shared.retrieveCachedObject(object: UserData.self, key: .userData) else {
                    route = .signin
                    return
                }
                userData.name = cachedUserDate.name
                userData.email = cachedUserDate.email
                userData.imageURL = cachedUserDate.imageURL
                route = .dashbaord
            }
        }
    }
}

#Preview {
    AppRootView()
}
