import SwiftUI
import RainbowFWK

struct DividerView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Divider")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		ScrollView {
			ComponentContainer(title: "Divider", settings: {},
				content: {
					DividerSwiftUI()
				}
			)
			ComponentContainer(title: "Divider variant 2", settings: {},
				content: {
					DividerSwiftUI(text: "or")
				}
			)
			ComponentContainer(title: "Divider variant 3", settings: {},
				content: {
					DividerSwiftUI(text: "Divider indication")
				}
			)
			
			ComponentContainer(title: "Divider variant 4", settings: {},
							   content: {
								DividerSwiftUI(category: true)
							   }
			)
		}
	}
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
