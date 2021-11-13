import SwiftUI
import RainbowFWK

struct ButtonsView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Button")
			content
				.animation(.spring())
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		
	}
	
	@State var primaryState: PrimaryBtnState = .disabled
	@State var secondaryType: SecondaryBtnType = .secondary
	@State var withSubtitle: Bool = false

	var content: some View {
		ScrollView {
			ComponentContainer(title: "Primary Button",
				settings: {
					VStack {
						Picker("State", selection: $primaryState) {
							Text("Disabled").tag(PrimaryBtnState.disabled)
							Text("Enabled").tag(PrimaryBtnState.enabled)
							Text("Loading").tag(PrimaryBtnState.loading)
							Text("Final Step").tag(PrimaryBtnState.finalStep)
						}
						Toggle(isOn: $withSubtitle, label: {
							Text("With subtitle").typography(.bodyXS)
						})
					}
				},
				content: {
					PrimaryBtnSwiftUI(title: "Next", subtitle: withSubtitle ? "This is a optional subtitle" : nil, state: $primaryState, onTap: {})
						.background(Color.white)
				}
			)
			ComponentContainer(
				title: "Secondary Button",
				settings: {
					Picker("Type", selection: $secondaryType) {
						Text("Secondary").tag(SecondaryBtnType.secondary)
						Text("Delete").tag(SecondaryBtnType.delete)
						Text("Link").tag(SecondaryBtnType.link)
					}
				},
				content: {
					SecondaryBtn(type: secondaryType, text: "This is a link"){}
				}
			)
		}
		.frame(width: UIScreen.width)
	}
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
