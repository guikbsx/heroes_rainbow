import SwiftUI
import RainbowFWK

struct BottomBarView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Bottom Bar")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentItem: BottomBarCellItem = .social
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Bottom Bar",
				settings: {},
				content: {
					BottomBar(currentItem: $currentItem)
				}
			)
		}
	}
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
