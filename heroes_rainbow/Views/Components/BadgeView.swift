import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct BadgeView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Badge", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var isOn: Bool = false
	
	var content: some View {
		ComponentContainer(
			title: "Badge",
			settings: {
				Toggle(isOn: $isOn, label: {
					Text("Icon").typography(.bodyXS)
				})
			},
			content: {
				Badge(
					icon: {
						if isOn {
							Image(emoji: "🥕")
								.resizable()
								.frame(width: 12, height: 12)
						}
					},
					text: "Text"
				)
				.redacted(reason: isLoading ? .placeholder : [])
			}
		)
	}
}

@available(iOS 14.0, *)
struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
