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
            let cachedUserDate = AppStore.shared.retrieveCachedObject(object: UserData.self, key: .userData)
            route = RouteDecider.nextRoute(seenSplash: AppStore.shared.seenSplashView, cachedUser: cachedUserDate)
            if let cached = cachedUserDate {
                userData.name = cached.name
                userData.email = cached.email
                userData.imageURL = cached.imageURL
            }
        }
    }
    
    enum RouteDecider {
        static func nextRoute(seenSplash: Bool, cachedUser: UserData?) -> AppRoutes {
            guard seenSplash else { return .splash }
            if cachedUser != nil { return .dashbaord }
            return .signin
        }
    }
}

#Preview {
    AppRootView()
}
