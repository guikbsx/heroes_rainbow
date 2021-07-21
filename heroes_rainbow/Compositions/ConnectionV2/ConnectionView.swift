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
		VStack {
			SubtitleSwiftUI(text: $model.subtitleLbl)
			NewVoice(title: $model.voiceLbl, actualStep: $model.actualStep, numberOfStep: .constant(6))
			ZStack {
				//5
				Color.pinkDS
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
				
				//2 bis
				RequestCreatePasswordView()
					.environmentObject(model)
					.offset(x: model.createPasswordOffset)

				//2
				RequestSignInView()
					.environmentObject(model)
					.offset(x: model.signInOffset)
				
				//1
				RequestMailView()
					.environmentObject(model)
					.offset(x: model.mailOffset)
			}
			.animation(.spring())
			Spacer()
			HStack {
				Button(action: { model.previous()}, label: {
					Text("Previous")
				})
				Spacer()
				Button(action: { model.next()}, label: {
					Text("Next")
				})
			}.padding()
		}
	}
	
	var connectionView: some View {
		Text("test")
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

