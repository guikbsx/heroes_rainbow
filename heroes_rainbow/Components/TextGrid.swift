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
			
			HStack {
				Text(label)
					.typography(.subtitleXS)
					.foregroundColor(.grey900)
					.multilineTextAlignment(.leading)
					.lineLimit(2)
//					.fixedSize()
				Spacer()
				if isNew {
					Color.powerDS
						.mask(
							Image(systemName: "star.circle.fill")
								.resizable()
								.frame(width: 18, height: 18)
						)
						.frame(width: 18, height: 18)
				}
			}
		}
		.padding(16)
		.frame(height: 60)
		.background(Color.grey100)
		.cornerRadius(16)
    }
}

struct TextGrid_Previews: PreviewProvider {
    static var previews: some View {
		TextGrid("Layout of body sunset")
			.previewLayout(.sizeThatFits)
			.frame(width: UIScreen.width / 3)
		TextGrid("Layout", isNew: true)
			.previewLayout(.sizeThatFits)
    }
}
