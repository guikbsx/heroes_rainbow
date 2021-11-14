import SwiftUI
import RainbowFWK

struct ItemActionView: View {
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
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Item Action", settings: {}, content: {
				ItemActionSwiftUI(
					image: Image(systemName: "brain.head.profile"),
					text: "This is a label",
					onTap: {}
				)
			})
		}
	}
}

struct ItemActionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionView()
    }
}