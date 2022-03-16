import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct ItemNamingView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Naming", isLoading: $isLoading)
			content
				.animation(.spring(), value: withAvatar)
				.animation(.spring(), value: isInfluencer)
				.animation(.spring(), value: isShowingOnboarding)
				.animation(.spring(), value: currentHashtag)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withAvatar: Bool = true
	@State var isInfluencer: Bool = true
	@State var isShowingOnboarding: Bool = true
	@State var currentHashtag: Hashtag? = nil

	var content: some View {
		VStack {
			ComponentContainer(title: "Item Choice", settings: {
				VStack(alignment: .leading) {
					Toggle(isOn: $withAvatar, label: { Text("Avatar").typography(.bodyXS) })
					Toggle(isOn: $isInfluencer, label: { Text("Influencer").typography(.bodyXS) })
					Toggle(isOn: $isShowingOnboarding, label: { Text("Onboarding").typography(.bodyXS) })

					HStack(spacing: 2) {
						Text("Tapped hashtag : ")
						Text(currentHashtag == nil ? "none" : currentHashtag!.name)
						Spacer()
					}
					.typography(.bodyXS)
				}
			}, content: {
				HStack {
					Text("ℹ️")
					Text("A Grey500 colored background has been applied here to distinguish white fonts.")
						.typography(.caption)
						.typography(.bodyXS)
						.foregroundColor(.grey500)
						.padding(.horizontal, 20)
						.lineLimit(2)
						.fixedSize(horizontal: false, vertical: true)
						.padding(.top)
				}
				ItemNamingSocial(
					currentHashtag: $currentHashtag,
					avatar: withAvatar ? "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png" : "",
					name: "Pantéa Négui",
					description: "This is the best Product Designer !",
					hashtags: [.init(id: "0", name: "HeroesJobs"), .init(id: "1", name: "Product")],
					isInfluencer: isInfluencer,
					didTapLogo: {},
					didTapBrand: {},
					isShowingOnboarding: isShowingOnboarding
				)
				.redacted(reason: isLoading ? .placeholder : [])
				.background(Color.grey500)
			})
		}
	}
}

@available(iOS 14.0, *)
struct ItemNamingView_Previews: PreviewProvider {
    static var previews: some View {
        ItemNamingView()
    }
}
