//
//  SplashView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: Properties
    @Binding var route: AppRoutes
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(spacing: 24) {
            
            TabView(selection: $currentIndex) {
                ForEach(0..<SplashSlide.splashSlides().count, id: \.self) { index in
                    SplashSlideView(slide: SplashSlide.splashSlides()[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Custom page indicator
            HStack(spacing: 8) {
                ForEach(0..<SplashSlide.splashSlides().count, id: \.self) { index in
                    Capsule()
                        .fill(index == currentIndex ? Color.purpleMain : Color.gray.opacity(0.3))
                        .frame(width: index == currentIndex ? 20 : 8, height: 8)
                        .animation(.easeInOut(duration: 0.2), value: currentIndex)
                }
            }
            
            // Last Slide
            if currentIndex == SplashSlide.splashSlides().count - 1 {
                Button("Start Learning") {
                    // AppStore.seenSplashView = true
                    route = .signin
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .background(Color.purpleMain)
                .cornerRadius(12)
            }
        }
        .padding()
        .animation(.easeInOut, value: currentIndex)
    }
}

#Preview {
    SplashView(route: .constant(.signin))
}
