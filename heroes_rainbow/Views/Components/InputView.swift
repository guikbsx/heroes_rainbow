import SwiftUI
import RainbowFWK

struct InputView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Input")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var text: String = ""
	@State var state: InputTextState = .unfocus
	
	var content: some View {
		ComponentContainer(title: "Text input",
			settings: {
				Picker("State", selection: $state) {
					Text("Unfocus").tag(InputTextState.unfocus)
					Text("Focus").tag(InputTextState.focus)
					Text("Error").tag(InputTextState.error)
				}
			},
			content: {
				InputTextSwiftUI(
					text: $text,
					state: $state,
					disableAutocorrection: true,
					placeholder: "Enter a mail"
				)
			}
		)
	}
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
