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
	
	@State var withCover: Bool = true
	@State var withProfilePicture: Bool = true
	@State var withHashtag: Bool = false

	@State var activateProfilePicture: Bool = true
	@State var activateButton1: Bool = true
	@State var activateButton2: Bool = true
	
	@State var isLoadingPicture: Bool = false
	@State var isLoadingCover: Bool = false
	
	@State var button1Icon: HeaderProfileIcon = .share
	@State var button2Icon: HeaderProfileIcon = .send
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Header Profile",
				settings: {
					VStack(alignment: .leading) {
						Group {
							Text("Activate atome")
								.typography(.caption)
								.foregroundColor(.grey500)
							Toggle(isOn: $activateProfilePicture, label: {
								Text("Activate profile picture").typography(.bodyXS)
							})
							Toggle(isOn: $activateButton1, label: {
								Text("Activate first button").typography(.bodyXS)
							})
							Toggle(isOn: $activateButton2, label: {
								Text("Activate second button").typography(.bodyXS)
							})
						}
						Group {
							Text("Image")
								.typography(.caption)
								.foregroundColor(.grey500)
						Toggle(isOn: $withCover, label: {
							Text("Cover picture image").typography(.bodyXS)
						})
						Toggle(isOn: $withProfilePicture, label: {
							Text("Profile picture image").typography(.bodyXS)
						})
						.disabled(!activateProfilePicture)
						}
						Group {
							Text("Functionality")
								.typography(.caption)
								.foregroundColor(.grey500)
							Toggle(isOn: $withHashtag, label: {
								Text("Hashtag").typography(.bodyXS)
							})
							Toggle(isOn: $isLoadingPicture, label: {
								Text("Loading picture").typography(.bodyXS)
							})
							Toggle(isOn: $isLoadingCover, label: {
								Text("Loading cover").typography(.bodyXS)
							})
							Text("Button 1 Icon")
								.typography(.caption)
								.foregroundColor(.grey500)
							Picker("Button 1 Icon", selection: $button1Icon) {
								Text("Share").tag(HeaderProfileIcon.share)
								Text("Send").tag(HeaderProfileIcon.send)
								Text("Edit").tag(HeaderProfileIcon.edit)
							}
							Text("Button 2 Icon")
								.typography(.caption)
								.foregroundColor(.grey500)
							Picker("Button 2 Icon", selection: $button2Icon) {
								Text("Share").tag(HeaderProfileIcon.share)
								Text("Send").tag(HeaderProfileIcon.send)
								Text("Edit").tag(HeaderProfileIcon.edit)
							}
						}
					}
				},
				content: {
					HeaderProfile(
						isLoadingPicture: $isLoadingPicture,
						isLoadingCover: $isLoadingCover,
						coverPicture: withCover ? "https://darkroom.contagious.com/1380/2ef9b6fde79f0b72f7efeee0c9826f00:193306a6fbb93c36bf67e3ff20cb5604/chipotle-2.jpg" : nil,
						profilePicture: withProfilePicture ? "https://s3-eu-west-1.amazonaws.com/francois-dev/users/141797/avatar1648459316.jpg" : nil,
						hashtag: withHashtag ? "InspiringHeroes" : "",
						didTapCoverPicture: {
							
						},
						didTapProfilePicture: activateProfilePicture ? {print("hello")} : nil,
						didTapButton1: activateButton1 ? {} : nil,
						didTapButton2: activateButton2 ? {} : nil,
						button1Icon: button1Icon,
						button2Icon: button2Icon
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
