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
}
