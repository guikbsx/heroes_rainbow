import SwiftUI
import RainbowFWK

struct SuperTopBar: View {
	@Environment(\.presentationMode) var presentationMode
	
	var category: String
	var title: String
	
    var body: some View {
		Rectangle()
			.fill(Color.purple500)
			.edgesIgnoringSafeArea(.all)
			.frame(height: 0)
		TopBarSwiftUI(
			component: .constant(.init(left: .back, middle: .none, right: .none)),
			leftBtn: {
				self.presentationMode.wrappedValue.dismiss()
			},
			centerLbl: .constant("")
		)
		VStack(alignment: .leading, spacing: 16) {
			CategoryView(category)
			Text("\(title) ")
				.typography(.header4)
				.gradientForeground(gradient: Color.powerDS)
		}
		.padding(.horizontal, 20)
    }
}

struct SuperTopBar_Previews: PreviewProvider {
    static var previews: some View {
		SuperTopBar(category: "Foundations", title: "Typography")
    }
}
