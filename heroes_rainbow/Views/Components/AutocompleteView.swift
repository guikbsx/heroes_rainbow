import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct AutocompleteView: View {
	
	@State var isLoading: Bool = false
	@State var withSeparator: Bool = true

	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Autocomplete", isLoading: $isLoading)
			VStack {
				Toggle(isOn: $withSeparator, label: { Text("Separator").typography(.bodyXS) })
			}
			.rainbowToggle()
			content
				.animation(.spring(), value: currentIndex)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentIndex: Int? = nil
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Geoloc",
				settings: {},
				content: {
					Autocomplete(index: 0, currentIndex: $currentIndex, separator: withSeparator, onTap: {})
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
			ComponentContainer(
				title: "Address",
				settings: {},
				content: {
					Autocomplete(title: "1 rue de Nice", subtitle: "Alforville, France", index: 1, currentIndex: $currentIndex, separator: withSeparator, onTap: {})
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
