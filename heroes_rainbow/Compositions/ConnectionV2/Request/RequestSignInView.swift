//
//  ConnectionView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import SwiftUI

struct RequestSignInView: View {
	@EnvironmentObject var model: ConnectionModel

	@State var textState: InputTextState = .unfocus

	@State var password: String = ""
	@State var passwordState: InputTextState = .unfocus
	
	@State var buttonState: PrimaryBtnState = .disabled

    var body: some View {
		//Handle iOS13 and the impossibility to use .onChange
		let mailBinding = Binding<String>(get: {
			model.emailLbl
		}, set: {
			model.emailLbl = $0
			buttonState = (model.emailLbl.isValidEmail() && !password.isEmpty) ? .enabled : .disabled
		})
		
		let passwordBinding = Binding<String>(get: {
			password
		}, set: {
			password = $0
			buttonState = (model.emailLbl.isValidEmail() && !password.isEmpty) ? .enabled : .disabled
		})
		
		ScrollView {
			VStack(spacing: 0) {
				InputTextSwiftUI(text: mailBinding, state: $textState, contentType: .emailAddress, placeholder: "Email")
				InputTextSecure(text: passwordBinding, state: $passwordState, contentType: .password, placeholder: "Password")
				PrimaryBtnSwiftUI(title: "Continue", subtitle: nil, state: $buttonState, onTap: {
					hideKeyboard()
					model.next()
				})
				DividerSwiftUI(text: "or")
				Button(action: {
					hideKeyboard()
					model.isShowingResetPassword.toggle()
				}) {
					ItemActionLink(text: "I forgot my password")
				}
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
