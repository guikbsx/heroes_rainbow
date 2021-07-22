//
//  OnboardingConnectionView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import SwiftUI


struct ConnectionView: View {
	@StateObject var model = ConnectionModel()

    var body: some View {
		ZStack {
			mainView
			ResetPasswordView()
				.environmentObject(model)
				.offset(y: model.isShowingResetPassword ? 0 : UIScreen.height)
				.animation(.spring())
			VerificationCodeView()
				.environmentObject(model)
				.offset(y: model.isShowingVerificationCode ? 0 : UIScreen.height)
				.animation(.spring())
		}
	}
	
	var mainView: some View {
		VStack {
			SubtitleSwiftUI(text: $model.subtitleLbl)
			NewVoice(title: $model.voiceLbl, actualStep: $model.actualStep, numberOfStep: .constant(5))
			ZStack {
				//5
				RequestNotificationsView()
					.environmentObject(model)
					.offset(x: model.notificationOffset)
				
				//4
				RequestCodeView()
					.environmentObject(model)
					.offset(x: model.codeOffset)
				
				//3
				RequestPhoneNumberView()
					.environmentObject(model)
					.offset(x: model.phoneNumberOffset)

				//2
				WrapSignView()
					.environmentObject(model)
					.offset(x: model.signOffset)
				
				//1
				RequestMailView()
					.environmentObject(model)
					.offset(x: model.mailOffset)
			}
			.animation(.spring())
			Spacer()
			
			//Test View to delete
			HStack {
				Button(action: { model.previous()}, label: {
					Image(systemName: "arrowtriangle.backward.circle.fill")
					Text("Previous")
				})
				Spacer()
				Button(action: { model.newUser.toggle()}, label: {
					Image(systemName: model.newUser ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.fill.badge.xmark")
					Text("New user : \(String(model.newUser))")
				})
				Spacer()
				Button(action: { model.next()}, label: {
					Image(systemName: "arrowtriangle.forward.circle.fill")
					Text("Next")
				})
			}.padding()
		}

	}
	
	
}

struct OnboardingConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}

struct DraggableModifier : ViewModifier {
	
	enum Direction {
		case vertical
		case horizontal
	}
	
	let direction: Direction
	
	@State private var draggedOffset: CGSize = .zero
	
	func body(content: Content) -> some View {
		content
			.offset(
				CGSize(width: direction == .vertical ? 0 : draggedOffset.width,
					   height: direction == .horizontal ? 0 : draggedOffset.height)
			)
			.gesture(
				DragGesture()
					.onChanged { value in
						self.draggedOffset = value.translation
					}
					.onEnded { value in
						self.draggedOffset = .zero
					}
			)
	}
	
}

