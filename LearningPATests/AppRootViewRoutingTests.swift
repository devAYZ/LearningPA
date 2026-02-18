//
//  AppRootViewRoutingTests.swift
//  LearningPATests
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import Testing
@testable import LearningPA

@Suite("AppRootView routing decisions")
struct AppRootViewRoutingTests {

    @Test
    func routesToSplashWhenNotSeen() async throws {
        let route = await AppRootView.RouteDecider.nextRoute(seenSplash: false, cachedUser: nil)
        #expect(route == .splash)
    }

    @Test
    func routesToSigninWhenSeenButNoUser() async throws {
        let route = await AppRootView.RouteDecider.nextRoute(seenSplash: true, cachedUser: nil)
        #expect(route == .signin)
    }

    @Test
    func routesToDashboardWhenSeenAndUser() async throws {
        let user = await UserData(name: "Ayo")
        let route = await AppRootView.RouteDecider.nextRoute(seenSplash: true, cachedUser: user)
        #expect(route == .dashbaord)
    }
}
