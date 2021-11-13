import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct BannersView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Banner")
			content
				.animation(.spring())
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.banner(
			title: "Make sure your internet connection is stable.",
			avatar: withAvatar ?  "https://taylordonato.com/wp-content/uploads/2020/10/Starbucks-Logo-1987.png" : nil,
			type: type,
			persistent: isPersistent,
			closeBtn: withCloseBtn,
			show: $isShowingBanner
		) {
			print("do something")
		}
	}
	
	@State var isShowingBanner: Bool = false

	@State var isPersistent: Bool = true
	@State var withAvatar: Bool = false
	@State var withCloseBtn: Bool = false
	@State var type: BannerType = .info
	
	var content: some View {
		ScrollView {
			ComponentContainer(title: "Banner", settings: {
				VStack {
					Toggle(isOn: $isPersistent, label: {
						Text("Persistent").typography(.bodyXS)
					})
					Toggle(isOn: $withAvatar, label: {
						Text("Avatar").typography(.bodyXS)
					})
					Toggle(isOn: $withCloseBtn, label: {
						Text("Close Button").typography(.bodyXS)
					})
					Picker("Type", selection: $type) {
						Text("Info").tag(BannerType.info)
						Text("Error").tag(BannerType.error)
					}
				}
			}, content: {
				SecondaryBtn(type: .secondary, text: "Activate banner") {
					isShowingBanner.toggle()
				}
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
