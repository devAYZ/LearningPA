//
//  DashboardViewModel.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import Foundation
import Observation

@Observable
class DashboardViewModel {
    var badges = [BadgeItem]()
    
    init() {
        generateBadges()
    }
    
    private func generateBadges()  {
        badges = [
            .init(
                title: "WWDC 2026",
                subtitle: "New Design System",
                level: "Genius",
                count: "3/3",
                image: "red_badge"
            ),
            .init(
                title: "Git Mastery",
                subtitle: "Version control excellence",
                level: "Regular",
                count: "1/3",
                image: "black_badge"
            ),
            .init(
                title: "Learning Champ",
                subtitle: "Readers are leaders; Act of reading.",
                level: "Perfect",
                count: "2/3",
                image: "blue_badge"
            ),
            .init(
                title: "Daily Streak",
                subtitle: "Consistency pays off",
                level: "Genius",
                count: "3/3",
                image: "red_badge"
            ),
            .init(
                title: "Atomicity",
                subtitle: "Physics is always right",
                level: "Perfect",
                count: "2/3",
                image: "blue_badge"
            )
        ]
    }
}
