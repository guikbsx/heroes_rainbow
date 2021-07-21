//
//  CreatePasswordView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import SwiftUI

struct RequestCreatePasswordView: View {
	@EnvironmentObject var model: ConnectionModel

	@State var upPassword: String = ""
	@State var upPasswordState: InputTextState = .unfocus
	
	@State var downPassword: String = ""
	@State var downPasswordState: InputTextState = .unfocus

	@State var buttonState: PrimaryBtnState = .disabled

    var body: some View {
		let upBinding = Binding<String>(get: {
			upPassword
		}, set: {
			upPassword = $0
			checkPassword()
		})
		
		let downBinding = Binding<String>(get: {
			downPassword
		}, set: {
			downPassword = $0
			checkPassword()
		})
		
		ScrollView {
			VStack(spacing: 0) {
				InputTextSecure(text: upBinding, state: $upPasswordState, placeholder: "Password")
				InputTextSecure(text: downBinding, state: $downPasswordState, placeholder: "Confirm password")
				Button(action: {
					hideKeyboard()
					model.next()
				}) {
					PrimaryBtnSwiftUI(title: "Continue", subtitle: nil, state: $buttonState)
				}
				Spacer()
			}
		}
    }
	
	func checkPassword() {
		let samePassword = !upPassword.isEmpty && !downPassword.isEmpty && upPassword == downPassword
		
		buttonState = samePassword ? .enabled : .disabled
	}
	
	func register(completion: (Bool) -> Void) {
		//Call API
		completion(true)
	}
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
		
        RequestCreatePasswordView()
			.environmentObject(model)
    }
}
