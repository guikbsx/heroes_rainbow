import SwiftUI
import RainbowFWK


@available(iOS 14.0, *)
struct MessagesView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Message", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Left Message", settings: {}, content: {
				ItemChatMessageLeft(message: "This is a message with CTAs. It should take 80% of the max size of a screen. CTAs respect 16px of spacing with link: https://google.fr", image: "https://taylordonato.com/wp-content/uploads/2020/10/Starbucks-Logo-1987.png")
					.redacted(reason: isLoading ? .placeholder : [])
			})
			ComponentContainer(title: "Right Message ", settings: {}, content: {
				ItemChatMessageRight(message: "This is a message of the writer with another link: https://apple.fr ", image: "")
					.redacted(reason: isLoading ? .placeholder : [])
			})
		}
	}
}

@available(iOS 14.0, *)
struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
