import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HomeTestView: View {
	@State var currentItem: BottomBarCellItem = .social
	
	var body: some View {
		NavigationView {
			ZStack {
				Color.red500
					.ignoresSafeArea()
				VStack(spacing: 0) {
					TabView(
						selection: $currentItem,
						content:  {
							NavigationLink(destination: Text("yes"), label: {
								Color.red
							})
								.edgesIgnoringSafeArea(.all)
								.tag(BottomBarCellItem.social)
							Text("Tab Content 2")
								.tag(BottomBarCellItem.chat)
							Text("Tab Content 3")
								.tag(BottomBarCellItem.me)
							Text("Tab Content 4")
								.tag(BottomBarCellItem.jobs)
						}
					)
						.edgesIgnoringSafeArea(.all)
						.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
					BottomBar(currentItem: $currentItem)
					Color.black.ignoresSafeArea().frame(height: 0)
				}
				.navigationTitle("")
				.navigationBarHidden(true)
			}
		}
		.edgesIgnoringSafeArea(.all)
	}
}

@available(iOS 14.0, *)
struct HomeTestView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTestView()
    }
}
