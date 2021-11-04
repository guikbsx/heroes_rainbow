import SwiftUI
import RainbowFWK

struct ButtonsView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Button")
			content
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		
	}
	
	@State var primaryState: PrimaryBtnState = .enabled
	@State var withSubtitle: Bool = true

	var content: some View {
		ScrollView {
			ComponentContainer(title: "Primary Button",
				settings: {
					VStack {
						Picker("State", selection: $primaryState) {
							Text("Enabled").tag(PrimaryBtnState.enabled)
							Text("Disabled").tag(PrimaryBtnState.disabled)
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
				title: "Link Button",
				settings: {},
				content: {
					ItemActionLink(text: "This is a link")
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
