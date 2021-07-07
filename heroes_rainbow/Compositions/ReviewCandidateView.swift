import SwiftUI

struct ReviewCandidateView: View {
	@Environment(\.presentationMode) var presentationMode
	@State var backgroundOpacity: Double = 0
	@State var isFullScreen: Bool = false
	@State var isSwitching: Bool = false
	
	var choices: [String] = ["Offer made", "No show", "Turned the applicant down", "Applicant is no longer interested"]
	var offsetiPhone: CGFloat {
		let device = UIDevice().deviceType
		switch device {
			case .iPhones_5_5s_5c_SE: 				return -210
			case .iPhones_6_6s_7_8: 				return -300
			case .iPhones_6Plus_6sPlus_7Plus_8Plus: return -350
			case .iPhone_X_XS_11Pro, .iPhone12mini: return -430
			case .iPhone_Xr_11: 					return -490
			case .iPhone_XsMax_11ProMax: 			return -495
			default: return 0
		}
	}
		
    var body: some View {
		ZStack(alignment: .bottom) {
			backgroundView
			
			ZStack(alignment: .bottom) {
			bigSheet
				.frame(height: UIScreen.main.bounds.height * 0.9)
				.opacity(isFullScreen ? 1 : 0)
				.animation(.spring().delay(0.8))

			littleSheet
				.opacity(isFullScreen ? 0 : 1)
				.animation(.spring())
			
			circleView
				.offset(y: isFullScreen ? offsetiPhone : -280)
				.animation(.spring().delay(0.5))
			}
			.opacity(isSwitching ? 0 : 1)
			.animation(.default)
			
			Button(action: {animateTransition()}, label: {
				Text("This is a test")
			})
		}
    }
		
	var bigSheet: some View {
		VStack {
			TopBarSwiftUI(skipBtn: { })
			TheVoiceSwiftUI(progression: .constant(1), text: "How did the interview go?")
			Rectangle()
				.fill(Color.white)
				.frame(height: 64)
			
			ScrollView {
				LazyVStack(spacing: 0) {
					Text("You interviewed Jane on Oct. 3 for a position as XXX.")
						.font(R.font.gilroyMedium.swiftUI(size: 18))
						.multilineTextAlignment(.center)
						.foregroundColor(R.color.blueGrey.color)
						.padding(.vertical, 16)
						.padding(.horizontal, 20)
					ForEach(choices, id: \.self) { choice in
						ItemChoiceSwiftUI(text: choice)
							
					}
				}
			}
		}
		.padding(.top, 12)
	}
	
	var littleSheet: some View {
		VStack {
			Text("You have 3 applicants that require a status update")
				.font(R.font.riftBoldItalic.swiftUI(size: 24))
				.multilineTextAlignment(.center)
			Button(action: { isFullScreen.toggle() }, label: {
				PrimaryBtnSwiftUI(text: "Update applicant Status", subtext: "", whiteShadow: false, state: .enabled, animated: false)
					.frame(height: 96)
			})
			Text("update later".uppercased())
				.font(R.font.gilroyBold.swiftUI(size: 16))
				.foregroundColor(R.color.purple.color)
				.padding(.vertical, 24)
		}
	}
	
	var backgroundView: some View {
		VStack {
			Spacer()
			Color.clear.ignoresSafeArea()
				.background(RoundedCorners(color: .white, tl: 8, tr: 8, bl: 0, br: 0).ignoresSafeArea())
				.frame(height : isFullScreen ? UIScreen.main.bounds.height * 0.9 : 313)
				.animation(.spring().delay(0.5))
		}
		.background(Color.gray.ignoresSafeArea())
	}
	
	var circleView: some View {
		ZStack {
			Circle()
				.strokeBorder(Color.white, lineWidth: 4)
				.background(Circle().fill(Color.blue))
				.frame(width: 64, height: 64)
				.offset(x: 16, y: 0)
			ZStack {
				Circle()
					.strokeBorder(Color.white, lineWidth: 4)
					.background(Circle().fill(Color.blue))
				Text("3")
					.font(.custom(R.font.riftBoldItalic, size: 40))
					.foregroundColor(.white)
			}
			.frame(width: 64, height: 64)
			.offset(x: -16, y: 0)
		}
	}
		
	func animateTransition() {
		if true { //Si c'est pas la fin des votes
			isSwitching.toggle()
			
			//Changer les infos ici
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
				
			}
			
			//Finir l'animation
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
				isSwitching.toggle()
			}
		} else { //C'est fini
			presentationMode.wrappedValue.dismiss()
		}
	}
}

struct ReviewCandidateView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCandidateView()
    }
}

struct RoundedCorners: View {
	var color: Color = .blue
	var tl: CGFloat = 0.0
	var tr: CGFloat = 0.0
	var bl: CGFloat = 0.0
	var br: CGFloat = 0.0
	
	var body: some View {
		GeometryReader { geometry in
			Path { path in
				
				let w = geometry.size.width
				let h = geometry.size.height
				
				// Make sure we do not exceed the size of the rectangle
				let tr = min(min(self.tr, h/2), w/2)
				let tl = min(min(self.tl, h/2), w/2)
				let bl = min(min(self.bl, h/2), w/2)
				let br = min(min(self.br, h/2), w/2)
				
				path.move(to: CGPoint(x: w / 2.0, y: 0))
				path.addLine(to: CGPoint(x: w - tr, y: 0))
				path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
				path.addLine(to: CGPoint(x: w, y: h - br))
				path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
				path.addLine(to: CGPoint(x: bl, y: h))
				path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
				path.addLine(to: CGPoint(x: 0, y: tl))
				path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
			}
			.fill(self.color)
		}
	}
}

