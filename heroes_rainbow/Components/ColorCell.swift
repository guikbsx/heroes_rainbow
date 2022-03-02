import SwiftUI
import RainbowFWK

struct ColorCell: View {
	var color: Color?
	var name: String
	
	var body: some View {
		ZStack {
			HStack(alignment: .center, spacing: 12) {
				if let color = color {
					RoundedRectangle(cornerRadius: 8)
						.fill(color)
						.elevation(style: .hills)
						.frame(height: 48)
						.padding(4)
				} else {
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.powerDS)
						.elevation(style: .hills)
						.frame(height: 48)
						.padding(4)
				}
			}
			Text(name)
				.foregroundColor(.white)
				.typography(.subtitleS)
				.lineLimit(1)
		}
	}
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ColorCell(color: Color.purple500, name: "Purple 500")
			ColorCell(name: "Power")

		}
		.previewLayout(.sizeThatFits)

    }
}
