//
//  DashboardView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: Properties
    @Environment(UserData.self) private var userData
    
    var body: some View {
        Text("Dashboard View")
            .onAppear {
                print(userData.email)
            }
    }
}

#Preview {
    DashboardView()
}
