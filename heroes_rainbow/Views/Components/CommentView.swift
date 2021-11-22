import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct CommentView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Comment")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var likes: Int? = 10
	@State var liked: Bool? = false
	@State var withLikes: Bool = true
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Comment", settings: {
				Toggle(isOn: $withLikes, label: {
					Text("Activate bunches of likes").typography(.bodyXS)
				})
			}, content: {
				Comment(
					id: "",
					avatar: "https://assets.heroes.jobs/users/13650/avatar_1582095738.jpg",
					name: "Erwan Rombo",
					comment: "This is my best comment ever. And also the first.",
					date: "",
					likes: $likes,
					liked: $liked,
					didTapAvatar: {
						
					}, didTapName: {
						
					}, didTapLike: {
						
					})
			})
			.valueChanged(value: withLikes, onChange: { withLikes in
				withAnimation {
					likes = withLikes ? 10 : 0
					if !withLikes { liked = false }
				}
			})
		}
	}
}

@available(iOS 14.0, *)
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
