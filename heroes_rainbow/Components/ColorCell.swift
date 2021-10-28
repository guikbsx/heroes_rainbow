import SwiftUI
import RainbowFWK

struct ColorCell: View {
	var color: Color?
	var name: String
	var subtitle: String
	
	var body: some View {
		HStack(alignment: .center, spacing: 12) {
			if let color = color {
				RoundedRectangle(cornerRadius: 8)
					.fill(color)
					.elevation(style: .hills)
					.frame(width: 75, height: 75)
					.padding(4)
			} else {
				RoundedRectangle(cornerRadius: 8)
					.fill(Color.powerDS)
					.elevation(style: .hills)
					.frame(width: 75, height: 75)
					.padding(4)
			}
			VStack(alignment: .leading, spacing: 8) {
				Text(name)
					.typography(.subtitleS)
					.foregroundColor(.grey900)
				Text(subtitle)
					.typography(.body)
					.foregroundColor(.grey400)
					.lineSpacing(4)
					.fixedSize(horizontal: false, vertical: true)
			}
			Spacer()
		}
	}
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
		ColorCell(name: "Purple 500", subtitle: "Some Subtitle\nTo work")
    }
}
