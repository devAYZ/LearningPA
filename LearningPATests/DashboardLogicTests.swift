//
//  DashboardLogicTests.swift
//  LearningPATests
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import Foundation
import Testing
@testable import LearningPA

@Suite("Dashboard greeting logic")
struct DashboardLogicTests {

    @Test("Morning greeting")
    func morning() throws {
        let date = makeDate(hour: 8)
        let g = DashboardView.dynamicGreeting(for: date)
        #expect(g.0 == "Good morning")
    }

    @Test("Afternoon greeting")
    func afternoon() throws {
        let date = makeDate(hour: 13)
        let g = DashboardView.dynamicGreeting(for: date)
        #expect(g.0 == "Good afternoon")
    }

    @Test("Evening greeting")
    func evening() throws {
        let date = makeDate(hour: 20)
        let g = DashboardView.dynamicGreeting(for: date)
        #expect(g.0 == "Good evening")
    }

    private func makeDate(hour: Int) -> Date {
        var comps = DateComponents()
        comps.year = 2026
        comps.month = 2
        comps.day = 1
        comps.hour = hour
        comps.minute = 0
        comps.second = 0
        return Calendar.current.date(from: comps) ?? Date()
    }
}
