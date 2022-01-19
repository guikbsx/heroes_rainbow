import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct ButtonsView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Button", isLoading: $isLoading)
			content
				.animation(.spring(), value: primaryState)
				.animation(.spring(), value: secondaryType)
				.animation(.spring(), value: withSubtitle)
				.animation(.spring(), value: isFollowed)

		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		
	}
	
	@State var primaryState: PrimaryBtnState = .disabled
	@State var secondaryType: SecondaryBtnType = .secondary
	@State var withSubtitle: Bool = false
	@State var isFollowed: Bool = false

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
						.redacted(reason: isLoading ? .placeholder : [])
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
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
			ComponentContainer(
				title: "Follow Button",
				settings: {
					Toggle(isOn: $isFollowed, label: {
						Text("Is following")
					})
				},
				content: {
					FollowBtn(isFollowed: $isFollowed) {}
						.redacted(reason: isLoading ? .placeholder : [])
				})
		}
		.frame(width: UIScreen.width)
	}
}

@available(iOS 14.0, *)
struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
