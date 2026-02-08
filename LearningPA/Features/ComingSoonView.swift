//
//  ComingSoonView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import SwiftUI

struct ComingSoonView: View {
    
    // MARK: Properties
    @State private var rotation: Double = 0
    var pageTitle: String
    
    var body: some View {
        VStack {
            Image(.helloRobot)
                .resizable()
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(
                        .linear(duration: 1)
                        .repeatForever(autoreverses: true)) {
                            rotation = 360
                        }
                }
            Text("\(pageTitle) coming soon..")
                .fontWeight(.medium)
                .font(.title2)
        }
    }
}

#Preview {
    ComingSoonView(pageTitle: "ComingSoonView")
}
