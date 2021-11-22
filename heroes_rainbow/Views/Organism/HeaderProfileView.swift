import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HeaderProfileView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Organism", title: "Header Profile")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withProfilePicture: Bool = true
	@State var withCoverPicture: Bool = true
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Header Profile",
				settings: {
					VStack {
						Toggle(isOn: $withCoverPicture, label: {
							Text("Cover Picture").typography(.bodyXS)
						})
						Toggle(isOn: $withProfilePicture, label: {
							Text("Profile Picture").typography(.bodyXS)
						})
					}
				},
				content: {
					HeaderProfile(
						coverPicture:
							withCoverPicture ? "https://darkroom.contagious.com/1380/2ef9b6fde79f0b72f7efeee0c9826f00:193306a6fbb93c36bf67e3ff20cb5604/chipotle-2.jpg" : nil,
						profilePicture:
							withProfilePicture ? "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freelogovectors.net%2Fwp-content%2Fuploads%2F2012%2F09%2Fchipotle-mexican-grill-logo.jpg&f=1&nofb=1" : nil,
						didTapCoverPicture: {},
						didTapProfilePicture: {},
						didTapShare: {},
						didTapSend: {}
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
