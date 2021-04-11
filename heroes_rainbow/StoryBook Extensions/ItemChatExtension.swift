import Foundation

extension HomeViewController {
    
    func setupItemChat() {
		let leftMessage = ItemChatMessageLeft(message: "This is a message of the recipient", image: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
		let leftLongMessage = ItemChatMessageLeft(
			message: "This is a message with CTAs. It should take 80% of the max size of a screen. CTAs respect 16px of spacing.",
			image: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png",
			action: true,
			secondaryLbl: "Cancel",
			primaryLbl: "Book"
		)
		let rightMessage = ItemChatMessageRight(message: "This is a message of the writer", image: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
		
		let automatic = ItemChatAutomatic(emoji: nil, label: "This is an automatic message", option: false)
		let cancelAutomatic = ItemChatAutomatic(emoji: "😞", label: "We let them know you had to cancel.", option: false)
		let optionAutomatic = ItemChatAutomatic(emoji: "😞", label: "This applicant can’t make it to your hiring event.", option: true)

		let accepted = ItemChatAccepted()
		let interviewDetail1 = ItemChatActive(location: .store, schedule: Date(), address: "121 rue de la Boustifouaille, 59800 Lille")
		let interviewDetail2 = ItemChatActive(location: .videoCall, schedule: Date(), address: "121 rue de la Boustifouaille, 59800 Lille")
		
		let cancelinterviewDetail1 = ItemChatCanceled(location: .store, schedule: Date(), address: "121 rue de la Boustifouaille, 59800 Lille")
		let cancelinterviewDetail2 = ItemChatCanceled(location: .videoCall, schedule: Date(), address: "121 rue de la Boustifouaille, 59800 Lille")
				
        let vc = StoryBookExampleViewController(
            title: "Item Chat ",
            components: [
				.init(title: "Left message", view: leftMessage.toUIView()),
				.init(title: "Long left message", view: leftLongMessage.toUIView()),
				.init(title: "Right message", view: rightMessage.toUIView()),
				
				.init(title: "Automatic message", view: automatic.toUIView()),
				.init(title: "Cancel automatic message", view: cancelAutomatic.toUIView()),
				.init(title: "Option automatic message", view: optionAutomatic.toUIView()),

				.init(title: "Accepted message", view: accepted.toUIView()),
				.init(title: "Interview detail with store", view: interviewDetail1.toUIView()),
				.init(title: "Interview detail with videocall", view: interviewDetail2.toUIView()),
				.init(title: "Cancel interview detail with store", view: cancelinterviewDetail1.toUIView()),
				.init(title: "Cancel interview detail with videocall", view: cancelinterviewDetail2.toUIView()),
			])
		
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
