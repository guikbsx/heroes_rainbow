import SwiftUI
import RainbowFWK

enum LoadingSucessType {
	case loading, success
}

@available(iOS 14.0, *)
struct LoadingSuccessView: View {
	
	@State private var sliderValue: Double = 10
	private let maxValue: Double = 100
	
	@State var type: LoadingSucessType = .success
	
	var body: some View {
		ZStack {
			progressView
				.offset(x: type == .loading ? 0 : -UIScreen.width)
			successView
				.offset(x: type == .loading ? UIScreen.width : 0)
		}
		.background(
			Color
				.turquoise500
				.frame(width: UIScreen.width, height: UIScreen.height)
				.edgesIgnoringSafeArea(.all)
		)
		.valueChanged(value: sliderValue, onChange: { value in
			if value == maxValue {
				withAnimation(.spring()) { self.type = .success }
			}
		})
    }
	
	var successView: some View {
		VStack {
			Image(emoji: "🎉")
				.resizable()
				.frame(width: 70, height: 70)
			Text(" Love it! ")
				.typography(.header3)
			Subtitle(text: .constant("A Heroes team member will be in touch to help make your profile even better."))
			PrimaryBtn(title: "Done", subtitle: nil, state: .constant(.enabled)) {
				print("done")
				withAnimation(.spring()) { type = .loading}
			}
		}
	}
	
	var progressView: some View {
		VStack {
			Spacer()
			ProgressCircle(value: sliderValue, maxValue: maxValue)
				.frame(width: 144, height: 144)
			Slider(value: $sliderValue,
				   in: 0...maxValue)
			Text("Posting...")
				.typography(.header3)
			Subtitle(text: .constant("2 mins remaining. Stay on this screen\nuntil it’s complete! "))
			Spacer()
		}
		.frame(width: UIScreen.width)
	}
}

@available(iOS 14.0, *)
struct LoadingSuccessView_Previews: PreviewProvider {
    static var previews: some View {
		LoadingSuccessView(type: .loading)
    }
}

struct ProgressCircle: View {
	enum Stroke {
		case line
		case dotted
		
		func strokeStyle(lineWidth: CGFloat) -> StrokeStyle {
			switch self {
				case .line:
					return StrokeStyle(lineWidth: lineWidth,
									   lineCap: .round)
				case .dotted:
					return StrokeStyle(lineWidth: lineWidth,
									   lineCap: .round,
									   dash: [12])
			}
		}
	}
	
	private let value: Double
	private let maxValue: Double
	private let style: Stroke
	private let backgroundEnabled: Bool
	private let backgroundColor: Color
	private let foregroundColor: Color
	private let lineWidth: CGFloat
	
	init(value: Double,
		 maxValue: Double,
		 style: Stroke = .line,
		 backgroundEnabled: Bool = true,
		 backgroundColor: Color = Color(UIColor(red: 245/255,
												green: 245/255,
												blue: 245/255,
												alpha: 1.0)),
		 foregroundColor: Color = Color.black,
		 lineWidth: CGFloat = 10) {
		self.value = value
		self.maxValue = maxValue
		self.style = style
		self.backgroundEnabled = backgroundEnabled
		self.backgroundColor = backgroundColor
		self.foregroundColor = foregroundColor
		self.lineWidth = lineWidth
	}
	
	var body: some View {
		ZStack {
			if self.backgroundEnabled {
				Circle()
					.stroke(lineWidth: self.lineWidth)
					.foregroundColor(self.backgroundColor)
			}
			
			Circle()
				.trim(from: 0, to: CGFloat(self.value / self.maxValue))
				.stroke(Color.powerDS, style: self.style.strokeStyle(lineWidth: self.lineWidth))
				.rotationEffect(Angle(degrees: -90))
				.animation(.spring())
			Text("\(Int((value / maxValue) * 100))%")
				.riftFont(style: .boldItalic, size: 28)
		}
	}
}
