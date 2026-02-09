//
//  DashboardView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: Environment
    @Environment(UserData.self) private var userData
    var dashboardVM: DashboardViewModel = .init()
    @State var continueLesson = false
    
    // MARK: Mock Data
    private let streakDays = 3
    private let todayProgress: Double = 0.6
    private let currentStage = 3
    private let totalStages = 11
    @State private var showAchievement = false
    @State private var selectedBadge: BadgeItem?
    
    // MARK: Body
    var body: some View {
        ScrollView {
            VStack(spacing: 60) {
                
                VStack(spacing: 20) {
                    headerSection
                    
                    todayLessonSection
                }
                
                VStack(spacing: 40) {
                    learningPathSection
                    
                    badgesSection
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .background(Color(.systemBackground))
    }
    
    var dynamicGreeting: (String, String) {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return ("Good morning", "Start the day with a bang! ☀️")
        case 12..<17: return ("Good afternoon", "You’re closer than you think 💪")
        default: return ("Good evening", "Wrap it up, it’s time to rest 🌙")
        }
    }
    
    var userName: String {
        userData.name ?? "-"
    }
}

// MARK: HeaderSection + Greetings
private extension DashboardView {
    var headerSection: some View {
        VStack(spacing: 16) {
            
            HStack {
                AsyncImage(url: userData.imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .fill(Color.orange.opacity(0.15))
                        .frame(width: 36, height: 36)
                }
                .overlay(
                    Circle()
                        .stroke(Color.purpleMain.opacity(0.5), lineWidth: 4)
                )
                .navigateTo(to: ComingSoonView(pageTitle: "Profile Page"))
                
                Spacer()
                
                streakView
            }
            
            VStack(spacing: 8) {
                Image(.helloRobot)
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Text("\(dynamicGreeting.0), \(userName)!")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(dynamicGreeting.1)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [
                    .white,
                    .purpleMain.opacity(0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    var streakView: some View {
        HStack(spacing: 6) {
            Image(systemName: "flame.fill")
                .foregroundColor(.purpleMain)
            
            Text("\(streakDays) days")
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.purpleMain.opacity(0.15))
        .clipShape(Capsule())
        .navigateTo(to: ComingSoonView(pageTitle: "Streak Tracking"))
    }
}

private extension DashboardView {
    var todayLessonSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("For today")
                .font(.headline)
            
            Button {
                continueLesson = true
            } label: {
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.purpleMain.opacity(0.15))
                        .frame(width: 44, height: 44)
                        .overlay(
                            Image(systemName: "swift")
                                .foregroundColor(.purpleMain)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Build a login screen in React")
                            .fontWeight(.medium)
                        
                        Text("Component lifecycle")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        ProgressView(value: todayProgress)
                            .tint(.purpleMain)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .alert("Continue Lesson?", isPresented: $continueLesson) {
                Button("OK") {}
                Button("Cancel", role: .cancel) {}
            }
            .buttonStyle(.plain)
        }
    }
}

private extension DashboardView {
    var learningPathSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Active learning path")
                .font(.headline)
            
            VStack(spacing: 14) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Fullstack Mobile Engineer")
                            .fontWeight(.medium)
                        
                        Text("Stage \(currentStage) of \(totalStages)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                
                ProgressView(value: Double(currentStage), total: Double(totalStages))
                    .tint(.purpleMain)
                
                Text("View full path →")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.purpleMain)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .navigateTo(to: LearningPathView())
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

private extension DashboardView {
    var badgesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Badges")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 8) {
                    ForEach(dashboardVM.badges, id: \.id) { badge in
                        Button {
                            selectedBadge = badge
                            showAchievement = true
                        } label: {
                            badgeView(title: badge.level, rate: badge.rate, image: badge.image)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 2)
                .sheet(isPresented: $showAchievement) {
                    AchievementSheetView(badge: $selectedBadge)
                        .presentationDetents([.medium, .large])
                }
            }
        }
    }
    
    func badgeView(title: String, rate: String, image: String) -> some View {
        VStack(spacing: 10) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(1)

            Text(rate)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(width: 70)
        .padding(10)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        DashboardView(dashboardVM: .init())
            .environment(UserData(
                name: "Ayo",
                email: "ayo@ayo.com",
                imageURL: .init(string: "https://lh3.googleusercontent.com/a/ACg8ocLVP8l3mFnAJtNy3b9d2t_r1ZiPkNyVD94_tg2eGFzJO3gQyQ=s200")
            ))
    }
}
