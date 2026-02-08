//
//  View+Ext.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 08/02/2026.
//

import SwiftUI

extension View {
    @ViewBuilder
    func navigateTo<Destination: View>(
        to destination: Destination
    ) -> some View {
        NavigationLink {
            destination
        } label: {
            self
        }
    }
}
