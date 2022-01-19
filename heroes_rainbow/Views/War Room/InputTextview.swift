import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct TestMyView: View {
	
	var body: some View {
//		(Text("Hello ") + Text(Image("Profile")) + Text(" World!") + Text(emoji: ""))
//			.foregroundColor(.blue)
//			.font(.largeTitle)
		Text(emoji: "C'est un test 😀🍂🌚🍕⚾️", fontSize: 75)
			.typography(.header1)
//			.foregroundColor(.blue)
			.lineSpacing(100)
	}
}

@available(iOS 14.0, *)
struct TestMyView_Previews: PreviewProvider {
	static var previews: some View {
		TestMyView()
			.previewLayout(.sizeThatFits)
	}
}
