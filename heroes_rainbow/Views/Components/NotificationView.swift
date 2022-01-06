import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct NotificationView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Notification", isLoading: $isLoading)
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ComponentContainer(
				title: "Notification",
				settings: {},
				content: {
					Notification(comment: "Adrien Dupont likes your comment", action: "", avatar: "https://assets.heroes.jobs/users/13650/avatar_1582095738.jpg", date: "5h", onTap: {})
					.redacted(reason: isLoading ? .placeholder : [])
				}
			)
		}
	}
}

@available(iOS 14.0, *)
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
