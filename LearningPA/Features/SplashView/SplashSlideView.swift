//
//  SplashSlideView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI

struct SplashSlideView: View {
    let slide: SplashSlide
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: slide.systemImage)
                .resizable()
                .scaledToFit()
                .frame(height: 160)
                .foregroundColor(.purpleMain)
            
            Text(slide.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(slide.subtitle)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Spacer()
        }
    }
}

#Preview {
    SplashSlideView(slide: .init(title: "ABC", subtitle: "ABC", systemImage: "globe"))
}
