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

	//InputBirthday
	@State var newDate: Date? = nil
	@State var isValidBirthday: Bool = false
	@State var elevationState: ElevationState = .default
	
	//InputDate
	@State var newDate2: Date? = nil
	@State var isValidDate: Bool = false
	@State var elevationState2: ElevationState = .default
	
	var content: some View {
		VStack {
			ComponentContainer(
				title: "Input Date",
				settings: {
					VStack {
						Toggle(isOn: $isValidDate, label: {
							Text("Valid date").typography(.bodyXS)
						}).disabled(true)
							.animation(.spring(), value: isValidBirthday)
					}
				},
				content: {
					InputDate(
						date: "01-01-1999",
						isValidDate: $isValidDate,
						elevationState: $elevationState2,
						newDate: $newDate2
					)
				})
			
			ComponentContainer(
				title: "Input Birthday",
				settings: {
					VStack {
						Toggle(isOn: $isValidBirthday, label: {
							Text("Valid birthday").typography(.bodyXS)
						}).disabled(true)
						.animation(.spring(), value: isValidBirthday)
					}
				},
				content: {
					InputBirthday(date: nil, isValidBirthday: $isValidBirthday, elevationState: $elevationState, newDate: $newDate)
				})
			
			ComponentContainer(
				title: "Text input",
				settings: {
					Picker("State", selection: $state) {
						Text("Unfocus").tag(InputTextState.unfocus)
						Text("Focus").tag(InputTextState.focus)
						Text("Error").tag(InputTextState.error)
					}.disabled(true)
				},
				content: {
					InputText(
						text: $inputTextSwiftUIText,
						state: $state,
						contentType: .emailAddress,
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
