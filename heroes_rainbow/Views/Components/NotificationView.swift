import SwiftUI
import RainbowFWK

struct NotificationView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Notification")
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
					Notification(comment: "Adrien Dupont likes your comment", action: "", avatar: "https://assets.heroes.jobs/users/13650/avatar_1582095738.jpg", date: "5h", onTap: {
						
					})
				}
			)
					}
	}
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
