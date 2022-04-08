import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct AutocompleteView: View {
	
	@State var isLoading: Bool = false
	@State var withSeparator: Bool = true

	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Autocomplete", isLoading: $isLoading)
			content
				.animation(.spring(), value: currentIndex)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentIndex: Int? = nil
	
	@State var type: AutocompleteType = .address
	@State var withImage: Bool = true
	@State var withSubtitle: Bool = true
	@State var separator: Bool = true

	@State var isFollowed: Bool = false
	@State var withAvatar: Bool = true
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Autocomplete",
				settings: {
					VStack {
						Picker("Type", selection: $type) {
							Text("Classic").tag(AutocompleteType.address)
							Text("Geoloc").tag(AutocompleteType.geoloc)
						}
						Group {
							Toggle(isOn: $withImage) { Text("Image").typography(.bodyXS) }
							Toggle(isOn: $withSubtitle) { Text("Subtitle").typography(.bodyXS) }
							Toggle(isOn: $separator) { Text("Separator").typography(.bodyXS) }
						}
						.disabled(type == .geoloc)
					}
				},
				content: {
					Autocomplete(
						type: type,
						icon: {
							if withImage {
								Image(systemName: "airpods.gen3")
							} else {
								EmptyView()
							}
						},
						title: "2044 Bridgerton Avenue",
						subtitle: withSubtitle ? "Seattle, WA, USA" : "",
						separator: separator,
						index: 0,
						currentIndex: $currentIndex,
						onTap: {
						
						}
					)
					.redacted(reason: isLoading ? .placeholder : [])
					.animation(.spring())
				}
			)

			ComponentContainer(
				title: "Contact List",
				settings: {
					Toggle(isOn: $withAvatar, label: {
						Text("Avatar").typography(.bodyXS)
					})
				},
				content: {
					ContactList(avatar: withAvatar ? "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png" : nil, name: "Pantéa Négui", tagline: "Product Design Savior", isFollowed: $isFollowed, didTapFollow: {
					})
						.animation(.spring(), value: withAvatar)
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
		}
	}
}

@available(iOS 14.0, *)
struct AutocompleteView_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteView()
    }
}
