import SwiftUI
import RainbowFWK

struct TextGrid: View {
	var label: String
	
	init(_ label: String) {
		self.label = label
	}
	
    var body: some View {
		HStack {
			Spacer()
			Text(label)
				.typography(.subtitleS)
				.foregroundColor(.black)
				.multilineTextAlignment(.center)
				.lineLimit(2)
			Spacer()
		}
		.padding(16)
		.frame(height: 80)
		.background(Color.grey100)
		.cornerRadius(16)
    }
}

struct TextGrid_Previews: PreviewProvider {
    static var previews: some View {
		TextGrid("Layout")
//			.frame(width: UIScreen)
//			.previewLayout(.sizeThatFits)
    }
}
