import RainbowFWK
import SwiftUI

@available(iOS 14.0, *)
struct HashtagsView: View {
	@Environment(\.presentationMode) var presentationMode

	var hashtag: String = "InspiringHeroes"
	
	var columns: [GridItem] =
		[
		 .init(.adaptive(minimum: 100, maximum: UIScreen.width / 3), spacing: 0, alignment: .center),
		 .init(.adaptive(minimum: 100, maximum: UIScreen.width / 3), spacing: 0, alignment: .center),
		 .init(.adaptive(minimum: 100, maximum: UIScreen.width / 3), spacing: 0, alignment: .center),
		]
	
    var body: some View {
		VStack {
			TopBarSwiftUI(component: .constant(.init(left: .back, middle: .label, right: .none)), leftBtn: {
				presentationMode.wrappedValue.dismiss()
			},centerLbl: .constant("#\(hashtag)".uppercased()))
			
			ScrollView {
				HeaderProfile(hashtag: hashtag, didTapShare: {
					
				})
				SubtitleSwiftUI(text: .constant("This is a long description of the # and you can use it for that"))
				LazyVGrid(columns: columns, spacing: 0) {
					ForEach(0...100, id: \.self, content: { index in
						Color.blue
							.frame(height: 146)
							.border(Color.white, width : 2)
					})
				}
				.padding(.horizontal, 20)
			}
			.frame(width: UIScreen.width)
		}
    }
}

@available(iOS 14.0, *)
struct HashtagsView_Previews: PreviewProvider {
    static var previews: some View {
        HashtagsView()
    }
}
