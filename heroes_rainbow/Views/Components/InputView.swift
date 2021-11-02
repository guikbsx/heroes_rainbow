import SwiftUI
import RainbowFWK

struct InputView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Input")
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var text: String = ""
	@State var state: InputTextState = .unfocus
	
	var content: some View {
		VStack(alignment: .leading) {
			Text("Text input")
				.typography(.subtitleXS)
				.padding(.horizontal, 20)
			VStack(alignment: .leading, spacing: 8) {
				if #available(iOS 14.0, *) {
					Picker("State", selection: $state) {
						Text("Unfocus").tag(InputTextState.unfocus)
						Text("Focus").tag(InputTextState.focus)
						Text("Error").tag(InputTextState.error)
					}
					.pickerStyle(SegmentedPickerStyle())
				}
			}
			.padding(12)
			.background(Color.grey100.cornerRadius(8))
			.padding(.horizontal, 20)

			InputTextSwiftUI(text: $text, state: $state, disableAutocorrection: true, placeholder: "Enter a mail")
				.background(Color.white)
		}
	}
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
