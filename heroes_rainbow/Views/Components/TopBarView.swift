import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct TopBarView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Top Bar", isLoading: $isLoading)
			content
				.animation(.spring(), value: self.left)
				.animation(.spring(), value: middle)
				.animation(.spring(), value: self.right)
				.animation(.spring(), value: withAvatar)
				.animation(.spring(), value: isBrand)
				.animation(.spring(), value: caption)
				.animation(.spring(), value: theme)
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
	@State var caption: Bool = false
	
	@State var theme: TopBarTheme = .white

	var content: some View {
		VStack {
			ComponentContainer(title: "Top Bar", settings: {
				VStack(alignment: .leading) {
					Group {
						Text("Theme")
							.gilroyFont(style: .regular, size: 12, color: .grey400)
						Picker("Theme", selection: $theme) {
							Text("White").tag(TopBarTheme.white)
							Text("Dark").tag(TopBarTheme.dark)
						}
						.padding(.bottom)
					}
					
					Group {
						Text("Left")
							.gilroyFont(style: .regular, size: 12, color: .grey400)
						Picker("Left", selection: $left) {
							Text("None").tag(TopBarLeft.none)
							Text("Back").tag(TopBarLeft.back)
							Text("Close").tag(TopBarLeft.close)
						}
						.padding(.bottom)
					}.disabled(theme == .dark)

					Group {
						Text("Middle")
							.gilroyFont(style: .regular, size: 12, color: .grey400)
						Picker("Middle", selection: $middle) {
							Text("None").tag(TopBarMiddle.none)
							Text("Label").tag(TopBarMiddle.label)
							Text("Chat").tag(TopBarMiddle.chat)
						}
						.padding(.bottom)
					}.disabled(theme == .dark)
					
					Group {
						Text("Right")
							.gilroyFont(style: .regular, size: 12, color: .grey400)
						Picker("Right", selection: $right) {
							Text("None").tag(TopBarRight.none)
							Text("Button").tag(TopBarRight.button)
							Text("Option").tag(TopBarRight.option)
						}
						.padding(.bottom)
					}.disabled(theme == .dark)
					
					Group {
						Toggle(isOn: $withAvatar, label: {
							Text("Avatar").typography(.bodyXS)
						})
						Toggle(isOn: $isBrand, label: {
							Text("Brand").typography(.bodyXS)
						})
						Toggle(isOn: $caption, label: {
							Text("Caption").typography(.bodyXS)
						})
					}.disabled(theme == .dark)

					
				}
			}, content: {
				TopBar(
					component: .constant(
						.init(
							left: left,
							middle: middle,
							right: right
						)
					),
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
					theme: theme
				)
				.redacted(reason: isLoading ? .placeholder : [])
				.background(theme == .white ? Color.clear : Color.black)
				.onChange(of: theme) {
					guard $0 == .dark else { return }
					left = .close
					middle = .none
					right = .none
				}
			})
		}
	}
}

@available(iOS 14.0, *)
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
