import SwiftUI
import RainbowFWK

struct BadgeView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Badge")
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
							EmojicaLabelSwiftUI(text: "🏋️", font: .systemFont(ofSize: 12))
						}
					},
					text: "Text"
				)
			}
		)
	}
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
