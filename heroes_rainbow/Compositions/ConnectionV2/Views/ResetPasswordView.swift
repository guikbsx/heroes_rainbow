//
//  ResetPasswordView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/07/2021.
//

import SwiftUI

struct ResetPasswordView: View {
	@EnvironmentObject var model: ConnectionModel
	
	@State var inputState: InputTextState = .unfocus
	@State var buttonState: PrimaryBtnState = .disabled
	
	@State var isShowingSendMailView: Bool = false
	
    var body: some View {
		ZStack {
			resetView
			mailView
				.offset(x: isShowingSendMailView ? 0 : UIScreen.height)
				.animation(.spring())
		}
		.background(Color.white.edgesIgnoringSafeArea(.all))
    }
	
	var resetView: some View {
		ScrollView {
			let binding = Binding<String>(get: {
				model.emailLbl
			}, set: {
				model.emailLbl = $0
				buttonState = model.emailLbl.isValidEmail() ? .enabled : .disabled
			})
			
			VStack {
				TopBarSwiftUI(component: .init(left: .none, middle: .none, right: .close), leftBtn: {}, rightBtn: {model.isShowingResetPassword.toggle()})
				PageTitle(title: "Reset your\npassword", textAlignment: .center)
				InputTextSwiftUI(text: binding, state: $inputState, placeholder: "Your email address")
				PrimaryBtnSwiftUI(title: "Send mail", subtitle: nil, state: $buttonState, onTap: {
					hideKeyboard()
					isShowingSendMailView.toggle()
				})
				Spacer()
			}
			.background(Color.white.edgesIgnoringSafeArea(.all))
		}
	}
	
	var mailView: some View {
		ScrollView {
			VStack {
				TopBarSwiftUI(component: .init(left: .back, middle: .none, right: .none), leftBtn: {isShowingSendMailView.toggle()})
				PageTitle(title: "We’ve sent you an email to reset your password!")
				Image(R.image.handsPhone2)
				Text("Check your account email to reset your password.")
					.padding(20)
					.multilineTextAlignment(.center)
					.font(R.font.gilroyRegular.swiftUI(size: 18))
				
				Spacer()
			}
			.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
						.onEnded{ value in
							if value.translation.width > 0 {
								isShowingSendMailView.toggle()
							}
						}
			)
			
			.background(Color.white.edgesIgnoringSafeArea(.all))
		}
	}
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
		
		ResetPasswordView()
			.environmentObject(model)
    }
}
