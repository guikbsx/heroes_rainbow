import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct BannersView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Banner")
			content
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
	}
	
	@State var isShowingBanner: Bool = false

	@State var withAvatar: Bool = false
	@State var withCloseBtn: Bool = false
	@State var type: BannerType = .info
	
	var content: some View {
		ScrollView {
			ComponentContainer(title: "Banner", settings: {
				VStack {
					Toggle(isOn: $withCloseBtn, label: {
						Text("Close Button").typography(.bodyXS)
					})
					Toggle(isOn: $withAvatar, label: {
						Text("Avatar").typography(.bodyXS)
					})
					Picker("Type", selection: $type) {
						Text("Info").tag(BannerType.info)
						Text("Error").tag(BannerType.error)
					}
				}
			}, content: {
				BannerView(
					title: withAvatar ? "Pantéa Negui commented your video" : type == .info ? "Make sure your internet connection is stable." : "The code you entered is wrong. Please verify your sms and retry.",
					avatar: withAvatar ? "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png": nil,
					image: nil,
					type: type,
					persistent: withCloseBtn,
					closeBtn: withCloseBtn
				)
			})
			
		}
	}
}

@available(iOS 14.0, *)
struct BannersView_Previews: PreviewProvider {
    static var previews: some View {
        BannersView()
    }
}
