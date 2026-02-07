//
//  SigninView.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import SwiftUI
import GoogleSignIn

struct SigninView: View {
    
    // MARK: Properties
    @Environment(UserData.self) private var userData
    @Binding var route: AppRoutes
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

extension SigninView {
    func handleSignInButton() {
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
