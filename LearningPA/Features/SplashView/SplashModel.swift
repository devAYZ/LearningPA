//
//  SplashModel.swift.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import Foundation

struct SplashSlide: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String
    
    
    static func splashSlides() -> [SplashSlide] {
        [
            SplashSlide(
                title: "Your Learning Path",
                subtitle: "Explore a structured curriculum designed to guide you step by step.",
                systemImage: "map"
            ),
            SplashSlide(
                title: "Daily Learning",
                subtitle: "See today’s lesson, track your progress, and stay consistent.",
                systemImage: "calendar"
            ),
            SplashSlide(
                title: "Achievements & Badges",
                subtitle: "Earn badges and celebrate milestones as you learn.",
                systemImage: "rosette"
            )
        ]
    }
}
