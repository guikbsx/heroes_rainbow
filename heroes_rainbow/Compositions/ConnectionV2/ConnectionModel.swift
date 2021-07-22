//
//  OnboardingConnectionModel.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import Foundation
import SwiftUI

enum ConnectionState: CGFloat {
	case mail = 1, sign = 2, phoneNumber = 3, code = 4, notification = 5
}

class ConnectionModel: ObservableObject {
	@Published public var subtitleLbl: String = ""
	@Published public var voiceLbl: String = ""
	
	@Published public var emailLbl: String = ""
	@Published public var passwordLbl: String = ""
	@Published public var phoneNumberLbl: String = ""
	
	@Published public var newUser: Bool = false
	
	@Published public var actualStep: CGFloat = 1
	@Published internal var actualStepState: ConnectionState = .mail
	
	@Published var isShowingResetPassword: Bool = false
	@Published var isShowingVerificationCode: Bool = false

	var pastSlide		: CGFloat = -UIScreen.main.bounds.width
	var actualSlide		: CGFloat = 0
	var previousSlide	: CGFloat = +UIScreen.main.bounds.width
	
	init() {
		updateView()
	}
	
	var mailOffset: CGFloat {
		if actualStepState.rawValue == 1 {
			return actualSlide
		} else {
			return pastSlide
		}
	}
	
	var signOffset: CGFloat {
		if actualStepState.rawValue < 2 {
			return previousSlide
		} else if actualStepState.rawValue == 2 {
			return actualSlide
		} else {
			return pastSlide
		}
	}
	
	var phoneNumberOffset: CGFloat {
		if actualStepState.rawValue < 3 {
			return previousSlide
		} else if actualStepState.rawValue == 3 {
			return actualSlide
		} else {
			return pastSlide
		}
	}
	
	var codeOffset: CGFloat {
		if actualStepState.rawValue < 4 {
			return previousSlide
		} else if actualStepState.rawValue == 4 {
			return actualSlide
		} else {
			return pastSlide
		}
	}
	
	var notificationOffset: CGFloat {
		if actualStepState.rawValue < 5 {
			return previousSlide
		} else {
			return 0
		}
	}
	
	
	func next() {
		switch actualStepState {
			case .mail:
				//Call API
				//If new user :
				actualStepState = .sign
				break
			case .sign:
				//Call API
				actualStepState = .phoneNumber
				break
			case .phoneNumber:
				//Call API
				actualStepState = .code
				break
			case .code:
				//Call API
				actualStepState = .notification
				break
			case .notification:
				//quit
				break
		}
		
		actualStep = actualStepState.rawValue
		updateView()
	}
	
	func previous() {

		switch actualStepState {
			case .mail:
				break
			case .sign:
				actualStepState = .mail
				break
			case .phoneNumber:
				actualStepState = .sign
				break
			case .code:
				actualStepState = .phoneNumber
				break
			case .notification:
				passwordLbl = ""
				actualStepState = .code
				break
		}
		
		actualStep = actualStepState.rawValue
		updateView()
	}
	
	private func updateView() {
		switch actualStepState {
			case .mail:
				subtitleLbl = "Hello! Nice to see you!"
				voiceLbl = "What’s your email address ?"
				break
			case .sign:
				if newUser {
					subtitleLbl = "Make an account"
					voiceLbl = "Create a\npassword"
				} else {
					subtitleLbl = "Welcome back!"
					voiceLbl = "Log in to your\naccount"
				}
				break
			case .phoneNumber:
				subtitleLbl = " "
				voiceLbl = "What’s your\nphone number?"
				break
			case .code:
				subtitleLbl = "Code sent to \(phoneNumberLbl)"
				voiceLbl = "Enter the code\nwe texted you"
				break
			case .notification:
				subtitleLbl = " "
				voiceLbl = "Stay on top of\nyour hiring"
				break
		}
	}
}

