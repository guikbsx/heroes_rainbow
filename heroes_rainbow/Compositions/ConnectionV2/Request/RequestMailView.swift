//
//  MailView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 15/07/2021.
//

import SwiftUI

struct RequestMailView: View {
	@EnvironmentObject var model: ConnectionModel
	
	@State var textState: InputTextState = .unfocus
	@State var buttonState: PrimaryBtnState = .disabled
	
    var body: some View {
		
		//Handle iOS13 and the impossibility to use .onChange
		let binding = Binding<String>(get: {
			model.emailLbl
		}, set: {
			model.emailLbl = $0
			buttonState = model.emailLbl.isValidEmail() ? .enabled : .disabled
		})
		
		VStack(spacing: 0) {
			InputTextSwiftUI(text: binding, state: $textState, placeholder: "Email")
			PrimaryBtnSwiftUI(title: "Continue", subtitle: nil, state: $buttonState, onTap: {
				hideKeyboard()
				model.next()
			})
			Spacer()
		}
		.animation(.spring())
		.background(Color.white)

    }
	
	private func sendEmail(completion: (Bool) -> Void) {
		//Call API
		completion(true)
	}
}

struct RequestMailView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
		
		RequestMailView()
			.environmentObject(model)
    }
}
