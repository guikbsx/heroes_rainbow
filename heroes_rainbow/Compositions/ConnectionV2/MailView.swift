//
//  MailView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 15/07/2021.
//

import SwiftUI

struct MailView: View {
	@EnvironmentObject var model: OnboardingConnectionModel
	@Binding var currentPage: Int
	
	@State var mail: String = ""
	@State var textState: InputTextState = .unfocus
	@State var buttonState: PrimaryBtnState = .disabled
	
    var body: some View {
		
		//Handle iOS13 and the impossibility to use .onChange
		let binding = Binding<String>(get: {
			mail
		}, set: {
			mail = $0
			buttonState = mail.isValidEmail() ? .enabled : .disabled
		})
		
		VStack(spacing: 0) {
			InputTextSwiftUI(text: binding, state: $textState, placeholder: "Email")
			Button(action: {
				sendEmail(completion: { value in
					if value {
						
					}
				})
				currentPage += 1
			}) {
				PrimaryBtnSwiftUI(title: "Continue", subtitle: nil, state: $buttonState)
			}
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

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
		let model = OnboardingConnectionModel()
		
		MailView(currentPage: .constant(0))
			.environmentObject(model)
    }
}
