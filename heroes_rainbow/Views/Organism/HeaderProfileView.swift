import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HeaderProfileView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Organism", title: "Header Profile", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withCover: Bool = false
	@State var withProfilePicture: Bool = false
	@State var withHashtag: Bool = false

	@State var activateProfilePicture: Bool = true
	@State var activateButton1: Bool = true
	@State var activateButton2: Bool = true
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Header Profile",
				settings: {
					VStack {
						Toggle(isOn: $activateProfilePicture, label: {
							Text("Activate profile picture").typography(.bodyXS)
						})
						Toggle(isOn: $activateButton1, label: {
							Text("Activate first button").typography(.bodyXS)
						})
						Toggle(isOn: $activateButton2, label: {
							Text("Activate second button").typography(.bodyXS)
						})
						Toggle(isOn: $withCover, label: {
							Text("Cover picture image").typography(.bodyXS)
						})
						Toggle(isOn: $withProfilePicture, label: {
							Text("Profile picture image").typography(.bodyXS)
						}).disabled(!activateProfilePicture)
						Toggle(isOn: $withHashtag, label: {
							Text("Hashtag").typography(.bodyXS)
						})
						HStack {
							Image(systemName: "info.circle")
								.foregroundColor(.purple500)
							Text("Buttons icons are also editable.")
								.typography(.caption)
								.typography(.bodyXS)
								.foregroundColor(.grey500)
								.fixedSize(horizontal: false, vertical: true)
							Spacer()
						}
					}
				},
				content: {
					HeaderProfile(
						coverPicture: withCover ? "https://darkroom.contagious.com/1380/2ef9b6fde79f0b72f7efeee0c9826f00:193306a6fbb93c36bf67e3ff20cb5604/chipotle-2.jpg" : nil,
						profilePicture: withProfilePicture ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freelogovectors.net%2Fwp-content%2Fuploads%2F2012%2F09%2Fchipotle-mexican-grill-logo.jpg&f=1&nofb=1" : nil,
						hashtag: withHashtag ? "InspiringHeroes" : "",
						didTapCoverPicture: {
							
						},
						didTapProfilePicture: activateProfilePicture ? {print("hello")} : nil,
						didTapButton1: activateButton1 ? {} : nil,
						didTapButton2: activateButton2 ? {} : nil
					)
				}
			)
		}

	}
}

@available(iOS 14.0, *)
struct HeaderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderProfileView()
    }
}
