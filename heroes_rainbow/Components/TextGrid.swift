import SwiftUI
import RainbowFWK

struct TextGrid: View {
	var label: String
	var isNew: Bool
	
	init(_ label: String, isNew: Bool = false) {
		self.label = label
		self.isNew = isNew
	}
	
	var body: some View {
		VStack {
			if isNew {
				Image(systemName: "star.circle.fill")
					.resizable()
					.frame(width: 18, height: 18)
					.foregroundColor(.purple500)
			}
			HStack {
				Spacer()
				
				Text(label)
					.typography(.subtitleXS)
					.foregroundColor(.black)
					.multilineTextAlignment(.center)
					.lineLimit(2)
				Spacer()
			}
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
			.frame(width: UIScreen.width / 2 - 40)
			.previewLayout(.sizeThatFits)
		TextGrid("Layout", isNew: true)
			.frame(width: UIScreen.width / 2 - 40)
			.previewLayout(.sizeThatFits)
    }
}
