//
//  LearningPathView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 09/02/2026.
//

import SwiftUI

struct LearningPathView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {

                header
            }
            .padding(.horizontal)
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

#Preview {
    LearningPathView()
}
