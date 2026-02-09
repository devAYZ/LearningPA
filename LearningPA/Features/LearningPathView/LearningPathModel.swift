//
//  LearningPathModel.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import Foundation

enum LearningStageState {
    case completed
    case current
    case locked
}

struct LearningStage: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let state: LearningStageState
    
    static let learningPathStages: [LearningStage] = [
        .init(title: "Programming Basics", subtitle: "", state: .completed),
        .init(title: "Git & Version Control", subtitle: "", state: .completed),
        .init(title: "Learn React", subtitle: "Component lifecycle", state: .current),
        .init(title: "Core Mobile UI Build", subtitle: "", state: .locked),
        .init(title: "Access Device Features", subtitle: "", state: .locked),
        .init(title: "Navigations and Forms", subtitle: "", state: .locked),
        .init(title: "Backend Architecture", subtitle: "", state: .locked),
        .init(title: "Node.js & Express", subtitle: "", state: .locked),
        .init(title: "Authentication & Authorization", subtitle: "", state: .locked),
        .init(title: "Write and Run Tests", subtitle: "", state: .locked),
        .init(title: "Publish your Mobile App", subtitle: "", state: .locked)
    ]
}
