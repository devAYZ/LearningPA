//
//  UserData.swift
//  LearningPA
//
//  Created by Ayokunle Fatokimi on 07/02/2026.
//

import Foundation
import Observation

@Observable
class UserData {
    var name: String?
    var email: String?
    var imageURL: URL?
    
    init(name: String? = nil, email: String? = nil, imageURL: URL? = nil) {
        self.name = name
        self.email = email
        self.imageURL = imageURL
    }
}

