import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct InputTextView: View {
	@State var text: String = ""
	
    var body: some View {
		Text("en fait, flemme.")
//		MultilineTextField("I have to cancel because...", text: $text, onCommit: {
//
//		}, typography: .subtitleS)
//		.frame(height: 144)
//		.padding(16)
//		.background(Color.white.cornerRadius(16).elevation(style: .hills))
//		.padding(.horizontal, 20)
//		.padding(.vertical, 8)
    }
}

@available(iOS 14.0, *)
struct InputTextView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextView()
			.previewLayout(.sizeThatFits)
    }
}

