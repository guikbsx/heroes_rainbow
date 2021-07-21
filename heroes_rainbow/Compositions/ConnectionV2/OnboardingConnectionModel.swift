//
//  OnboardingConnectionModel.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import Foundation

class OnboardingConnectionModel: ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var phoneNumber: String = ""
	@Published var newUser: Bool = false
}

