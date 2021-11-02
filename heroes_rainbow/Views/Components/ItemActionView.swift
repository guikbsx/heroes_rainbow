import SwiftUI
import RainbowFWK

struct ItemActionView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Action")
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ItemActionSwiftUI(
				image: Image(R.image.logo_contour_color),
				text: "This is a label",
				onTap: {}
			)
		}
	}
}

struct ItemActionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionView()
    }
}
