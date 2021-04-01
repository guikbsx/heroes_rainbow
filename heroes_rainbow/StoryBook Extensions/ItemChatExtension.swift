import Foundation

extension HomeViewController {
    
    func configureItemChat() {
        let shortMessage = ItemChatMessageTableViewCell()
		shortMessage.setup(type: .recipiant, text: "This is a test", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
		
        let longMessage = ItemChatMessageTableViewCell()
        longMessage.setup(type: .recipiant, text: "This is a message with CTAs. It should take 80% of the max size of a screen. CTAs respect 16px of spacing.", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png", CTA: true)
        let writtenMessage = ItemChatMessageTableViewCell()
        writtenMessage.setup(type: .writter, text: "This is a message of the writter", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
        
        let vc = StoryBookExampleViewController(
            title: "Item Chat ",
            components: [
                .init(title: "Short recipiant message", view: shortMessage),
                .init(title: "Long recipiant message", view: longMessage),
                .init(title: "Writter message", view: writtenMessage),
            ])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
