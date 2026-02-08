//
//  AchievementView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import SwiftUI

struct AchievementSheetView: View {

    @State private var flipAngle: Double = 0
    @Binding var badge: BadgeItem?

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                badgeView

                titleSection

                shareButton
            }
            .padding()
            .padding(.top)
        }
    }
    
    var badgeView: some View {
        VStack {
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    flipAngle += 180
                }
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.2.circlepath")
                    Text("Flip badge")
                }
                .font(.callout)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .clipShape(Capsule())
                .tint(.purpleMain)
            }
            
            Image("\(badge?.image ?? "blue_badge")")
                .resizable()
                .frame(width: 150, height: 150)
                .rotation3DEffect(.degrees(flipAngle), axis: (x: 0, y: 1, z: 0))
                .animation(.spring(response: 0.8, dampingFraction: 0.9), value: flipAngle)
        }
    }
    
    var titleSection: some View {
        VStack(spacing: 12) {
            
            Text(badge?.title ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(badge?.subtitle ?? "")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    var shareButton: some View {
            Button {
                shareAchievement()
            } label: {
                Text("Share your achievement")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purpleMain)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }

        func shareAchievement() {
            print("Achievement shared!")
        }
}

#Preview {
    AchievementSheetView(badge: .constant(BadgeItem(
        title: "A", subtitle: "", level: "", count: "B", image: "C"
    )))
}
