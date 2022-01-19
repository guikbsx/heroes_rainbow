import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct ItemChoiceView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Action", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentIndex: Int? = nil

	var content: some View {
		VStack {
			ComponentContainer(title: "Item Choice", settings: {}, content: {
				Group {
					ItemChoiceSwiftUI(text: "Input name", index: 0, currentIndex: $currentIndex, onTap: {})
					ItemChoiceSwiftUI(text: "This is a long input name that lives int two lines on an item", index: 1, currentIndex: $currentIndex, onTap: {})
					ItemChoiceSwiftUI(text: "Athleta", subtitle: "255 Sutter ST, San Francisco, CA 94108, USA", index: 2, currentIndex: $currentIndex, onTap: {})
				}
				.redacted(reason: isLoading ? .placeholder : [])
			})
		}
	}
}

@available(iOS 14.0, *)
struct ItemChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemChoiceView()
    }
}
