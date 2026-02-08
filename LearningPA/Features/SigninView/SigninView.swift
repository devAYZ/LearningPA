//
//  SigninView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SigninView: View {
    
    // MARK: Properties
    @Environment(UserData.self) private var userData
    @Binding var route: AppRoutes
    
    var body: some View {
        ZStack {
            Image(.blueBadge)
                .aspectRatio(contentMode: .fill)
                .opacity(0.1)
            VStack(spacing: 10) {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purpleMain)
                Text("Sign in to Start Learning")
                    .font(.title2)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                // Google sign-in button
                GoogleSignInButton(style: .wide, action: handleGoogleLogin)
                    .frame(width: 120)
                    .padding(.top, 25)
            }
            .padding()
        }
    }
}

extension SigninView {
    func handleGoogleLogin() {
        guard let presentingVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { signInResult, error in
            guard error == nil else {
                return
            }
            
            // If sign in succeeded, display the app's main content View.
            guard let result = signInResult else {
                return
            }
            
            @Bindable var userData = userData
            userData = .init(
                name: result.user.profile?.name,
                email: result.user.profile?.email,
                imageURL: result.user.profile?.imageURL(withDimension: 200)
            )
            
            // Trigger naviagate to Dashboard
            route = .dashbaord
        }
    }
}

#Preview {
    SigninView(route: .constant(.dashbaord))
}
