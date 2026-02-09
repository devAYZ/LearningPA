//
//  DashboardModels.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import Foundation

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
}
