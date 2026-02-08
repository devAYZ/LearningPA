//
//  DashboardModels.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import Foundation
import Observation

@Observable
class BadgeItem {
    let id = UUID()
    let title: String
    let subtitle: String
    let level: String
    let rate: String
    let image: String
    
    init(title: String, subtitle: String, level: String, count: String, image: String) {
        self.title = title
        self.subtitle = subtitle
        self.level = level
        self.rate = count
        self.image = image
    }
    
    static func badges() -> [BadgeItem] {
        [
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
                subtitle: "Version control excellence",
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
