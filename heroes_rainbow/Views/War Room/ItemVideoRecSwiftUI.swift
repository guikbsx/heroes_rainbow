import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
public struct ItemVideoRecSwiftUI: View {
	
	@State var isRecording = false
	
	@Namespace var animation
	
	public var body: some View {
		ZStack {
			Circle()
				.stroke(Color.powerDS, lineWidth: 4)
				.frame(width: isRecording ? 90 : 56, height: isRecording ? 90 : 56)
			circleView
		}
	}
	
	var circleView: some View {
		ZStack {
			if isRecording {
				RoundedRectangle(cornerRadius: 4)
					.fill(Color.red500)
					.matchedGeometryEffect(id: "ID", in: animation)
					.frame(width: 24, height: 24)
					.onTapGesture {
						withAnimation {
							isRecording.toggle()
						}
					}
			} else {
				RoundedRectangle(cornerRadius: 20)
					.fill(Color.red500)
					.matchedGeometryEffect(id: "ID", in: animation)
					.frame(width: 40, height: 40)
					.onTapGesture {
						withAnimation {
							isRecording.toggle()
						}
					}
			}
		}
	}
}

@available(iOS 14.0, *)
struct ItemVideoRecSwiftUI_Previews: PreviewProvider {
	static var previews: some View {
		ItemVideoRecSwiftUI()
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.grey900)
	}
}
