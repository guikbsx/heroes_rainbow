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
	@State var withPlusButton: Bool = false
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Bottom Bar",
				settings: {
					Toggle(isOn: $withPlusButton, label: {
						Text("Plus button")
					})
				},
				content: {
					BottomBar(currentItem: $currentItem, didTapAdd: withPlusButton ? {} : nil)
						.animation(.spring())
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
