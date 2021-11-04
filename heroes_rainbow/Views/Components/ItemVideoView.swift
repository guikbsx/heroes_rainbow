import SwiftUI
import RainbowFWK

struct ItemVideoView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Videos")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ComponentContainer(
				title: "Item Videos",
				settings: {
					
				}, content: {
					
				}
			)
		}
	}
}

struct ItemVideoView_Previews: PreviewProvider {
    static var previews: some View {
        ItemVideoView()
    }
}
