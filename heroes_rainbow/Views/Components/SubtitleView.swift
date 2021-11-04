import SwiftUI
import RainbowFWK

struct SubtitleView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Subtitle")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Subtitle", settings: {}, content: {
				SubtitleSwiftUI(text: .constant("This is a very very long subtitle that will be handle in 3 lines like this. This is the design system "))
					.frame(width: UIScreen.width)
			})
		}
	}}

struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView()
    }
}
