import SwiftUI
import RainbowFWK

struct ItemActionView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Action")
			content
				.animation(.spring())
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withSubtitle: Bool = false
	@State var withLabel: Bool = false
	
	var content: some View {
		ScrollView {
		VStack {
			ComponentContainer(title: "Item Action 🚧", settings: {
				Toggle(isOn: $withSubtitle, label: {
					Text("Subtitle").typography(.bodyXS)
				})
			}, content: {
				ItemActionSwiftUI(image: {
					Image(systemName: "airplane")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.purple500)
				}, text: withSubtitle ? "Mon. DD" : "This is a label", subtitle: withSubtitle ? "HH:MM AM- HH:MM AM" : nil)
			})
			ComponentContainer(title: "Item Action Location", settings: {
				Toggle(isOn: $withLabel, label: {
					Text("Label").typography(.bodyXS)
				})
			}, content: {
				if #available(iOS 14.0, *) {
					ItemActionLocation(
						text: withLabel ? "Brooklyn Bridge" : "",
						onTap: {}
					)
				} else {
					// Fallback on earlier versions
				}
			})
		}
		}
	}
}

struct ItemActionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionView()
    }
}
