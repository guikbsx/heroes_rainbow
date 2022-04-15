//import SwiftUI
//import RainbowFWK
//import Lottie
//
//@available(iOS 14.0, *)
//public struct SuccessView: View {
//
//	public init(
//		title: String = "",
//		subtitle: String = "",
//		btnTitle: String = "OK"
//	) {
//		self.title = title
//		self.subtitle = subtitle
//		self.btnTitle = btnTitle
//	}
//
//	var title: String
//	var subtitle: String
//	var btnTitle: String
//
//	private var lottie = LottieView(animation: AnimationView(name: .confetti))
//	@State private var opacityLottie: CGFloat = 1
//
//	private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//	@State private var timerValue: Int = 0
//
//	public var body: some View {
//		ZStack {
//			lottie
//				.frame(width: UIScreen.width, height: UIScreen.height)
//				.offset(y: -100)
//				.onAppear {
//					lottie.animation.loopMode = .playOnce
//					lottie.play {
//						opacityLottie = 0
//					}
//				}
//				.opacity(opacityLottie)
//			successView
//		}
//		.background(
//			Color
//				.turquoise500
//				.frame(width: UIScreen.width, height: UIScreen.height)
//				.edgesIgnoringSafeArea(.all)
//		)
//    }
//
//	var successView: some View {
//		VStack(spacing: 0) {
//			Image(emoji: "🎉")
//				.resizable()
//				.frame(width: 70, height: 70)
//				.padding(.bottom, 24)
//			if timerValue >= 1 {
//				VStack(spacing: 12) {
//					if !title.isEmpty {
//						Text(title)
//							.typography(.header3)
//					}
//					if !subtitle.isEmpty {
//						Subtitle(text: .constant(subtitle))
//					}
//				}
//				.transition(.opacity.combined(with: .move(edge: .bottom)))
//				PrimaryBtn(title: btnTitle, subtitle: nil, state: .constant(.enabled)) {
//					print("done")
//				}
//				.opacity(timerValue == 2 ? 1 : 0)
//			}
//		}
//		.multilineTextAlignment(.center)
//		.animation(.spring(), value: timerValue)
//		.onReceive(timer) { _ in
//			guard timerValue < 2 else { return }
//			timerValue += 1
//		}
//	}
//}
//
//@available(iOS 14.0, *)
//
//struct LoadingSuccessView_Previews: PreviewProvider {
//    static var previews: some View {
//		SuccessView(title: "Experience added to your profile", subtitle: "Life is made of experiences.", btnTitle: "Back to my profile")
//    }
//}
