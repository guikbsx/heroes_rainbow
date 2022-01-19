import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
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
	
	@State var model = ItemVideoRecData(maxValue: 60)
	
	var content: some View {
		VStack {
			ComponentContainer(
				title: "Item Videos Rec",
				settings: {
				}, content: {
					ItemVideoRecSwiftUI()
						.environmentObject(model)
				}
			)
		}
	}
}

@available(iOS 14.0, *)
struct ItemVideoView_Previews: PreviewProvider {
    static var previews: some View {
        ItemVideoView()
    }
}
