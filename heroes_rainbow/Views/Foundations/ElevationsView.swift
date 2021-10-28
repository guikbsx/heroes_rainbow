import SwiftUI
import RainbowFWK

struct ElevationsView: View {
	@Environment(\.presentationMode) var presentationMode
	@State var state: ElevationState = .default
	
	init() { RainbowFWK.load() }
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Brand", title: "Typography")
			Picker("State", selection: $state) {
				Text("Default").tag(ElevationState.default)
				Text("Error").tag(ElevationState.error)
				Text("Focus").tag(ElevationState.focus)
			}
			.pickerStyle(SegmentedPickerStyle())
			.padding(.horizontal, 20)
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))

	}
		
	var content: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 28) {
				
				//Hills
				HStack(alignment: .center, spacing: 24) {
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.white)
						.frame(width: UIScreen.width / 3, height: 100)
						.elevation(style: .hills, state: state)
						.padding(4)
					VStack(alignment: .leading, spacing: 8) {
						Text("Hills")
							.typography(.subtitleS)
							.foregroundColor(.grey900)
						Text("x : 0\ny : 1\nblur : 4")
							.typography(.body)
							.foregroundColor(.grey500)
							.lineSpacing(4)
					}
					Spacer()
				}
				
				//Mountains
				HStack(alignment: .center, spacing: 24) {
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.white)
						.frame(width: UIScreen.width / 3, height: 100)
						.elevation(style: .mountains, state: state)
						.padding(4)
					VStack(alignment: .leading, spacing: 8) {
						Text("Mountains")
							.typography(.subtitleS)
							.foregroundColor(.grey900)
						Text("x : 0\ny : 2\nblur : 8")
							.typography(.body)
							.foregroundColor(.grey500)
							.lineSpacing(4)
					}
					Spacer()
				}
				
				//Clouds
				HStack(alignment: .center, spacing: 24) {
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.white)
						.frame(width: UIScreen.width / 3, height: 100)
						.elevation(style: .clouds, state: state)
						.padding(4)
					VStack(alignment: .leading, spacing: 8) {
						Text("Clouds")
							.typography(.subtitleS)
							.foregroundColor(.grey900)
						Text("x : 0\ny : 4\nblur : 16")
							.typography(.body)
							.foregroundColor(.grey500)
							.lineSpacing(4)
					}
					Spacer()
				}
				
				//Stars
				HStack(alignment: .center, spacing: 24) {
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.white)
						.frame(width: UIScreen.width / 3, height: 100)
						.elevation(style: .stars, state: state)
						.padding(4)
					VStack(alignment: .leading, spacing: 8) {
						Text("Stars")
							.typography(.subtitleS)
							.foregroundColor(.grey900)
						Text("x: 0\ny: 6\nblur: 24")
							.typography(.body)
							.foregroundColor(.grey500)
							.lineSpacing(4)
					}
					Spacer()
				}
				
			}
			.padding(20)
		}
		.frame(width: UIScreen.width)
	}
}

struct ElevationsView_Previews: PreviewProvider {
    static var previews: some View {
        ElevationsView()
    }
}
