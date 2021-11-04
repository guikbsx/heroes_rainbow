import SwiftUI
import RainbowFWK
import SwiftDate

struct ChatListView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Chat List")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var isOn: Bool = false
	var content: some View {
		ComponentContainer(title: "Item Chat List",
			settings: {
				Toggle(isOn: $isOn, label: {Text("Activate unread message").typography(.bodyXS)})
			},
			content: {
				ItemChatList(model: ItemChatListModel(id: 0, candidate: ItemChatListCandidate(id: 0, name: "Arthur", avatar: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimg4.wikia.nocookie.net%2F__cb20110901200337%2Fharrypotter%2Ffr%2Fimages%2Fc%2Fc1%2FPromoHP7_Arthur_Weasley.jpg&f=1&nofb=1"), jobs: [.init(id: 0, name: "Minister of Magic ")], interviewDate: nil), message: "What is the function of a rubber duck?", unread: isOn)
			}
		)
	}
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}

class ChatListDelegate: NSObject, ItemChatListDelegate {
	func didTapSelector(model: ItemChatListModel) {
		
	}
}
