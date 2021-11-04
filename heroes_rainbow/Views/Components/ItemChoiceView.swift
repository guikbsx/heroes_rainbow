import SwiftUI
import RainbowFWK

struct ItemChoiceView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Action")
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
			})
		}
	}
}

struct ItemChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemChoiceView()
    }
}
