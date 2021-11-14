import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
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
	
	@State var inputTextSwiftUIText: String = ""
	@State var state: InputTextState = .unfocus
	
	@State var inputChatTextViewText: String = ""
	@State var isActive: Bool = true

	
	var content: some View {
		VStack {
			ComponentContainer(
				title: "Text input",
				settings: {
					Picker("State", selection: $state) {
						Text("Unfocus").tag(InputTextState.unfocus)
						Text("Focus").tag(InputTextState.focus)
						Text("Error").tag(InputTextState.error)
					}
				},
				content: {
					InputTextSwiftUI(
						text: $inputTextSwiftUIText,
						state: $state,
						disableAutocorrection: true,
						placeholder: "Enter a mail"
					)
				}
			)
			ComponentContainer(
				title: "Text View Input",
				settings: {
					Toggle(isOn: $isActive, label: {
						Text("Active").typography(.bodyXS)
					})
				},
				content: {
					VStack {
						InputChatTextView(placeholder: "Message") {_ in 
							
						}
						.frame(maxHeight: 146)
					}
				}
			)
			.keyboardAdaptive()

		}
	}
}

@available(iOS 14.0, *)
struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}