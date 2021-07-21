//
//  ConnectionView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import SwiftUI

struct RequestSignInView: View {
	@EnvironmentObject var model: ConnectionModel

	@State var mail: String = ""
	@State var textState: InputTextState = .unfocus

	@State var password: String = ""
	@State var passwordState: InputTextState = .unfocus
	
	@State var buttonState: PrimaryBtnState = .disabled

    var body: some View {
		//Handle iOS13 and the impossibility to use .onChange
		let mailBinding = Binding<String>(get: {
			mail
		}, set: {
			mail = $0
			buttonState = (mail.isValidEmail() && !password.isEmpty) ? .enabled : .disabled
		})
		
		let passwordBinding = Binding<String>(get: {
			password
		}, set: {
			password = $0
			buttonState = (mail.isValidEmail() && !password.isEmpty) ? .enabled : .disabled
		})
		
		ScrollView {
			VStack(spacing: 0) {
				InputTextSwiftUI(text: mailBinding, state: $textState, placeholder: "Email")
				InputTextSecure(text: passwordBinding, state: $passwordState, placeholder: "Password")
				Button(action: {
					hideKeyboard()
					model.next()
				}) {
					PrimaryBtnSwiftUI(title: "Continue", subtitle: nil, state: $buttonState)
				}
//				.disabled(buttonState != .enabled)
				DividerSwiftUI(text: "or")
				ItemActionLink(text: "I forgot my password")
				Spacer()
			}
			.background(Color.white)
		}
    }
	
	func signIn(completion: (Bool) -> Void) {
		//Call API
		completion(true)
	}
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        RequestSignInView()
    }
}
