import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct SubtitleView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Subtitle", isLoading: $isLoading)
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
				Subtitle(text: .constant("This is a very very long subtitle that will be handle in 3 lines like this. This is the design system "))
					.frame(width: UIScreen.width)
					.redacted(reason: isLoading ? .placeholder : [])
			})
		}
	}}

@available(iOS 14.0, *)
struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView()
    }
}
