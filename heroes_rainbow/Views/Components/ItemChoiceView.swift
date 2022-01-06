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
	
	@State var selected: Bool = false
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Item Choice", settings: {}, content: {
				ItemChoiceSwiftUI(text: "This is your choice", selected: $selected, onTap: {
				})
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
