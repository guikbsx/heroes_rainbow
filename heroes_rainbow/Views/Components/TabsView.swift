import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct TabsView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Tabs")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var currentTab: TabsState = .myVideo
	
	var content: some View {
		ComponentContainer(
			title: "Tabs",
			settings: {
				
			},
			content: {
				Tabs(currentTab: $currentTab)
			}
		)
	}
}

@available(iOS 14.0, *)
struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
