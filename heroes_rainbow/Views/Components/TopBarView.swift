import SwiftUI
import RainbowFWK

struct TopBarView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Top Bar")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var left: TopBarLeft = .back
	@State var middle: TopBarMiddle = .none
	@State var right: TopBarRight = .none
	
	@State var withAvatar: Bool = false

	var content: some View {
		VStack {
			ComponentContainer(title: "Top Bar", settings: {
				VStack(alignment: .leading) {
					Text("Left")
						.gilroyFont(style: .regular, size: 12, color: .grey400)
					Picker("Left", selection: $left) {
						Text("None").tag(TopBarLeft.none)
						Text("Back").tag(TopBarLeft.back)
					}
					Text("Middle")
						.gilroyFont(style: .regular, size: 12, color: .grey400)
					Picker("Middle", selection: $middle) {
						Text("None").tag(TopBarMiddle.none)
						Text("Label").tag(TopBarMiddle.label)
					}
					Text("Right")
						.gilroyFont(style: .regular, size: 12, color: .grey400)
					Picker("Right", selection: $right) {
						Text("None").tag(TopBarRight.none)
						Text("Button").tag(TopBarRight.button)
						Text("Close").tag(TopBarRight.close)
					}
				}
			}, content: {
				TopBarSwiftUI(component: .constant(TopBarStruct(left: left, middle: middle, right: right)), centerLbl: .constant("This is an info"))
			})
			ComponentContainer(title: "Top Bar Chat", settings: {
				Toggle(isOn: $withAvatar, label: {
					Text("Avatar").typography(.bodyXS)
				})
			}, content: {
				TopBarChat(avatar: withAvatar ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freelogovectors.net%2Fwp-content%2Fuploads%2F2012%2F09%2Fchipotle-mexican-grill-logo.jpg&f=1&nofb=1" : nil, title: "Chipotle", didTapName: {}, didTapBack: {})
			})
		}
		.animation(.spring())
	}
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
