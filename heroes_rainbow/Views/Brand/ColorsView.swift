import SwiftUI
import RainbowFWK

struct ColorsView: View {

	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Brand", title: "Colors")
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 12) {
				Group {
					Text("Brand colors :")
						.typography(.subtitle)
					ColorCell(
						color: nil,
						name: "Power gradient",
						subtitle: "Pink, Turquoise and Purple\n+45 degrees"
					)
					ColorCell(
						color: .purple500,
						name: "Purple 500",
						subtitle: "#5F6BEF\nR: 95 V: 107 B: 239 "
					)
					ColorCell(
						color: .purple100,
						name: "Purple 100",
						subtitle: "#DFE1FC\nR: 223 V: 225 B: 252 "
					)
					ColorCell(
						color: .turquoise500,
						name: "Turquoise 500",
						subtitle: "#81FFD7\nR: 129 V: 255 B: 215 "
					)
					ColorCell(
						color: .pink500,
						name: "Pink 500",
						subtitle: "#E46EF8\nR: 228 V: 110 B: 248 "
					)
				}
				
				Group {
					Text("Brand colors :")
						.typography(.subtitle)
						.padding(.top)
					ColorCell(
						color: .grey100,
						name: "Grey 100",
						subtitle: "#E0E2E9\nR: 224 V: 226 B: 233 "
					)
					ColorCell(
						color: .grey200,
						name: "Grey 200",
						subtitle: "#C1C6D3\nR: 193 V: 198 B: 221 "
					)
					ColorCell(
						color: .grey300,
						name: "Grey 300",
						subtitle: "#A3A9BC\nR: 163 V: 169 B: 188 "
					)
					ColorCell(
						color: .grey400,
						name: "Grey 400",
						subtitle: "#848DA6\nR: 132 V: 141 B: 166 "
					)
					ColorCell(
						color: .grey500,
						name: "Grey 500",
						subtitle: "#657090\nR: 101 V: 112 B: 144 "
					)
					ColorCell(
						color: .grey600,
						name: "Grey 600",
						subtitle: "#515A73\nR: 81 V: 90 B: 115 "
					)
					ColorCell(
						color: .grey700,
						name: "Grey 700",
						subtitle: "#3D4356\nR: 61 V: 67 B: 86 "
					)
					ColorCell(
						color: .grey800,
						name: "Grey 800",
						subtitle: "#282D3A\nR: 61 V: 67 B: 86 "
					)
					ColorCell(
						color: .grey900,
						name: "Grey 900",
						subtitle: "#14161D\nR: 20 V: 22 B: 29 "
					)
				}
				
				Group {
					Text("Feedback colors :")
						.typography(.subtitle)
						.padding(.top)
					ColorCell(
						color: .red500,
						name: "Red 500",
						subtitle: "#FF6C6C\nR: 255 V: 108 B: 108 "
					)
				}
			}
			.padding(20)
		}
		.frame(width: UIScreen.width)
	}
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}
