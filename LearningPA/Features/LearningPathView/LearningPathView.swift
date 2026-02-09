//
//  LearningPathView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import SwiftUI

struct LearningPathView: View {
    let stages = LearningStage.learningPathStages
    var body: some View {
        ScrollView {
            VStack(spacing: 48) {

                header

                VStack(spacing: 20) {
                    ForEach(Array(stages.enumerated()), id: \.element.id) { index, stage in
                        LearningStageNode(
                            stage: stage,
                            alignment: index.isMultiple(of: 2) ? .leading : .trailing,
                            showConnector: index != stages.count - 1
                        )
                    }
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 40)
        }
    }
}

private extension LearningPathView {
    var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Stage 3 of 11")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("Fullstack mobile engineer path")
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LearningStageNode: View {

    let stage: LearningStage
    let alignment: HorizontalAlignment
    let showConnector: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 12) {

            badge

            VStack(alignment: alignment, spacing: 4) {
                Text(stage.title)
                    .fontWeight(.semibold)

                if !stage.subtitle.isEmpty {
                    Text(stage.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: 160, alignment: alignment == .leading ? .leading : .trailing)

            if showConnector {
                connector
                    .frame(height: 120)
                    .offset(y: -8)
            }
        }
        .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
    }
}

private extension LearningStageNode {
    var badge: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: 76, height: 76)
                .overlay(
                    Circle()
                        .stroke(borderColor, lineWidth: stage.state == .current ? 4 : 2)
                )
                .shadow(
                    color: stage.state == .current ? borderColor.opacity(0.4) : .clear,
                    radius: 10,
                    y: 6
                )

            Image(badgeImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
        }
        .scaleEffect(stage.state == .current ? 1.1 : 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: stage.state)
    }

    var borderColor: Color {
        switch stage.state {
        case .completed: return .purple
        case .current:   return .blue
        case .locked:    return Color.gray.opacity(0.3)
        }
    }

    var backgroundColor: Color {
        switch stage.state {
        case .completed: return Color.purple.opacity(0.15)
        case .current:   return Color.blue.opacity(0.15)
        case .locked:    return Color.gray.opacity(0.1)
        }
    }

    var badgeImageName: String {
        switch stage.state {
        case .completed: return "red_badge"
        case .current:   return "blue_badge"
        case .locked:    return "black_badge"
        }
    }
}

private extension LearningStageNode {
    var connector: some View {
        Rectangle()
            .stroke(
                stage.state == .completed
                    ? Color.purple
                    : Color.gray.opacity(0.4),
                style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round,
                    dash: [6, 6]
                )
            )
            .frame(width: 2)
            .opacity(0.6)
    }
}

#Preview {
    LearningPathView()
}
