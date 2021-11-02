import SwiftUI
import RainbowFWK

struct DividerView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Divider")
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack(spacing: 8) {
			Group {
				DividerSwiftUI()
				DividerSwiftUI(text: "or")
				DividerSwiftUI(text: "Divider indication")
			}
			.background(Color.white)
		}
	}
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
