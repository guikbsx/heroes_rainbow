//
//  OnboardingConnectionView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 20/07/2021.
//

import SwiftUI


struct OnboardingConnectionView: View {
	@StateObject var model = OnboardingConnectionModel()
	@State private var currentPage: Int = 0
	
	var mailOffset: CGFloat {
		if currentPage == 0 {
			return 0
		} else {
			return -UIScreen.main.bounds.width
		}
	}
	
	var connectionOffset: CGFloat {
		if currentPage < 1 {
			return +UIScreen.main.bounds.width
		} else {
			return 0
		}
	}

    var body: some View {
		VStack {
			SubtitleSwiftUI(text: "Welcome back!")
//			TheVoiceSwiftUI(title: "Log in to your\naccount")
//				.frame(height : 152)
			ZStack {
				//2 bis
				CreatePasswordView()
					.offset(x: connectionOffset)

				//2
				ConnectionView()
					.offset(x: connectionOffset)
				
				//1
				MailView(currentPage: $currentPage)
					.offset(x: mailOffset)
			}
			.animation(.spring())
			Spacer()
		}
	}
	
	var connectionView: some View {
		Text("test")
	}
}

struct OnboardingConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingConnectionView()
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

