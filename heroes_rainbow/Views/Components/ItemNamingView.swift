import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct ItemNamingView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Naming")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withAvatar: Bool = true
	@State var currentHashtag: Hashtag? = nil
	var content: some View {
		VStack {
			ComponentContainer(title: "Item Choice", settings: {
				VStack(alignment: .leading) {
					Toggle(isOn: $withAvatar, label: { Text("Avatar").typography(.bodyXS) })
					HStack(spacing: 2) {
						Text("Tapped hashtag : ")
						Text(currentHashtag == nil ? "none" : currentHashtag!.name)
						Spacer()
					}
					.typography(.bodyXS)
				}
			}, content: {
				ItemNamingSocialSwiftUI(
					avatar: withAvatar ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freelogovectors.net%2Fwp-content%2Fuploads%2F2012%2F09%2Fchipotle-mexican-grill-logo.jpg&f=1&nofb=1" : nil,
					name: "Chipotle",
					description: "This is a wonderful job you find ! This is a wonderful job you find ! This is a wonderful job you find ! This is a wonderful job you find !",
					hashtags: [
						.init(id: "", name: "fun"),
						.init(id: "", name: "young"),
						.init(id: "", name: "tryByYourself"),
						.init(id: "", name: "happy"),
					],
					currentHashtag: $currentHashtag
				)
				.background(Color.grey500)
				HStack {
					Text("ℹ️")
					Text("A gray colored background has been applied here to distinguish white fonts.")
						.typography(.caption)
						.typography(.bodyXS)
						.foregroundColor(.grey500)
				}
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
