import SwiftUI
import RainbowFWK

struct AutocompleteView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Autocomplete")
			if #available(iOS 14.0, *) {
				Toggle(isOn: $withSeparator, label: {
					Text("Separator").typography(.bodyXS)
				})
				.toggleStyle(SwitchToggleStyle(tint: .purple500))
				.padding(12)
				.background(Color.grey100.cornerRadius(8))
				.padding(.horizontal, 20)
			}
			content
				.animation(.spring())
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentIndex: Int? = nil
	@State var withSeparator: Bool = true
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Geoloc",
				settings: {
				},
				content: {
					Autocomplete(index: 0, currentIndex: $currentIndex, separator: withSeparator, onTap: {
						
					})
				}
			)
			ComponentContainer(
				title: "Address",
				settings: {},
				content: {
					Autocomplete(title: "1 rue de Nice", subtitle: "Alforville, France", index: 1, currentIndex: $currentIndex, separator: withSeparator, onTap: {
						
					})
				}
			)
		}
	}
}

struct AutocompleteView_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteView()
    }
}
