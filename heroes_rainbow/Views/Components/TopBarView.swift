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
	@State var middle: TopBarMiddle = .chat
	@State var right: TopBarRight = .none
	
	@State var withAvatar: Bool = true
	@State var isBrand: Bool = true
	@State var elevation: Bool = false
	@State var caption: Bool = false

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
					.padding(.bottom)
					
					Text("Middle")
						.gilroyFont(style: .regular, size: 12, color: .grey400)
					Picker("Middle", selection: $middle) {
						Text("None").tag(TopBarMiddle.none)
						Text("Label").tag(TopBarMiddle.label)
						Text("Chat").tag(TopBarMiddle.chat)
					}
					.padding(.bottom)
					
					Text("Right")
						.gilroyFont(style: .regular, size: 12, color: .grey400)
					Picker("Right", selection: $right) {
						Text("None").tag(TopBarRight.none)
						Text("Button").tag(TopBarRight.button)
						Text("Close").tag(TopBarRight.close)
					}
					.padding(.bottom)
					
					Toggle(isOn: $withAvatar, label: {
						Text("Avatar").typography(.bodyXS)
					})
					Toggle(isOn: $isBrand, label: {
						Text("Brand").typography(.bodyXS)
					})
					Toggle(isOn: $caption, label: {
						Text("Caption").typography(.bodyXS)
					})
					Toggle(isOn: $elevation, label: {
						Text("Elevation").typography(.bodyXS)
					})
				}
			}, content: {
				TopBarSwiftUI(
					component: .constant(.init(
									left: left,
									middle: middle,
									right: right
					)),
					leftBtn: {},
					middleBtn: {},
					rightBtn: {},
					skipLbl: "Button",
					centerLbl: .constant("This is a info"),
					avatar: !withAvatar ? "" : isBrand ? "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png" : "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png",
					title: isBrand ? "Heroes Jobs team" : "Pantéa Négui",
					subtitle: isBrand ? nil : "Barista",
					caption: isBrand ? nil : caption ? "$15 / hour" : nil,
					isBrand: isBrand,
					elevation: elevation
				)
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
