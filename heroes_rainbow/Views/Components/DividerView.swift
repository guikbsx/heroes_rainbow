import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct DividerView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Divider", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		ScrollView {
			ComponentContainer(
				title: "Divider",
				settings: {},
				content: {
					HeroesDivider()
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
			ComponentContainer(
				title: "Divider variant 2",
				settings: {},
				
				content: {
					HeroesDivider(text: "or")
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
			ComponentContainer(
				title: "Divider variant 3",
				settings: {},
				
				content: {
					HeroesDivider(text: "Divider indication")
						.redacted(reason: isLoading ? .placeholder : [])
				}
			)
			ComponentContainer(
				title: "Divider variant 4",
				settings: {},
				content: {
					HeroesDivider(category: true)
				}
			)
		}
	}
}

@available(iOS 14.0, *)
struct DividerView_Previews: PreviewProvider {
	static var previews: some View {
		DividerView()
	}
}
