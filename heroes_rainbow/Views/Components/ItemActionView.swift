import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct ItemActionView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Action", isLoading: $isLoading)
			content
				.animation(.spring(), value: withSubtitle)
				.animation(.spring(), value: withLabel)
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
				ItemAction(image: {
					Image(systemName: "airplane")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.purple500)
				}, text: withSubtitle ? "Mon. DD" : "This is a label", subtitle: withSubtitle ? "HH:MM AM- HH:MM AM" : nil)
				.redacted(reason: isLoading ? .placeholder : [])
			})
			ComponentContainer(title: "Item Action Location", settings: {
				Toggle(isOn: $withLabel, label: {
					Text("Label").typography(.bodyXS)
				})
			}, content: {
				ItemActionLocation(
					text: withLabel ? "Brooklyn Bridge" : "",
					onTap: {}
				)
				.redacted(reason: isLoading ? .placeholder : [])
			})
		}
		}
	}
}

@available(iOS 14.0, *)
struct ItemActionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionView()
    }
}
