import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HomeTestView: View {
	@State var currentItem: BottomBarCellItem = .social
	
	@State var zIndex: BottomBarCellItem = .social

	var body: some View {
		VStack(spacing: 0) {
			TabView(
				selection: $currentItem,
				content:  {
					Text("Tab Content 1")
						.tag(BottomBarCellItem.social)
					Text("Tab Content 2")
						.tag(BottomBarCellItem.chat)
					Text("Tab Content 3")
						.tag(BottomBarCellItem.me)
					Text("Tab Content 4")
						.tag(BottomBarCellItem.jobs)
				}
			)
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			BottomBar(currentItem: $currentItem)
			Color.black.ignoresSafeArea().frame(height: 0)
		}
	}
}

@available(iOS 14.0, *)
struct HomeTestView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTestView()
    }
}
