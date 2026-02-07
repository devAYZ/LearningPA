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
    
    var body: some View {
        Group {
            switch route {
            case .splash:
                SplashView(route: $route)
            case .signin:
                SigninView(route: $route)
            case .dashbaord:
                EmptyView()
            }
        }
        .onAppear {
            if AppStore.seenSplashView {
            }
        }
    }
}

#Preview {
    AppRootView()
}
