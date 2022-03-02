import SwiftUI
import RainbowFWK

struct ColorsView: View {
	
	var purpleColors: [Color] = [.purple100, .purple200, .purple300, .purple400, .purple500, .purple600, .purple700, .purple800, .purple900]
	var pinkColors: [Color] = [.pink100, .pink200, .pink300, .pink400, .pink500, .pink600, .pink700, .pink800, .pink900]
	var turquoiseColors: [Color] = [.turquoise100, .turquoise200, .turquoise300, .turquoise400, .turquoise500, .turquoise600, .turquoise700, .turquoise800, .turquoise900]
	var greyColors: [Color] = [.grey100, .grey200, .grey300, .grey400, .grey500, .grey600, .grey700, .grey800, .grey900]



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
					Text("Brand colors & System UI")
						.typography(.subtitleXS)
						.foregroundColor(.grey900)
					ColorCell(
						color: nil,
						name: "Power gradient"
					)
					ColorCell(
						color: Color.red500,
						name: "Red500"
					)
				}
				
				Group {
					Text("Pink")
						.typography(.subtitleXS)
						.foregroundColor(.grey900)
					ForEach(pinkColors, id: \.self) { color in
						ColorCell(
							color: color,
							name: color
								.description
								.substring(fromIndex: 18)
								.substring(toIndex: 7)
						)
					}
				}
				
				Group {
					Text("Purple")
						.typography(.subtitleXS)
						.foregroundColor(.grey900)
					ForEach(purpleColors, id: \.self) { color in
						ColorCell(
							color: color,
							name: color
								.description
								.substring(fromIndex: 18)
								.substring(toIndex: 9)
						)
					}
				}
				
				Group {
					Text("Turquoise")
						.typography(.subtitleXS)
						.foregroundColor(.grey900)
					ForEach(turquoiseColors, id: \.self) { color in
						ColorCell(
							color: color,
							name: color
								.description
								.substring(fromIndex: 18)
								.substring(toIndex: 12)
						)
					}
				}
				
				Group {
					Text("Grey")
						.typography(.subtitleXS)
						.foregroundColor(.grey900)
					ForEach(greyColors, id: \.self) { color in
						ColorCell(
							color: color,
							name: color
								.description
								.substring(fromIndex: 18)
								.substring(toIndex: 7)
						)
					}
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
