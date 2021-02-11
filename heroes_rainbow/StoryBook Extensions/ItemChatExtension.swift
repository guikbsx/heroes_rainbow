import Foundation

extension HomeViewController {
    
    func configureItemChat() {
        let shortMessage = ItemChatMessageTableViewCell()
        shortMessage.setup(type: .recipiant, text: "This is a message of the recipiant")
        let longMessage = ItemChatMessageTableViewCell()
        longMessage.setup(type: .recipiant, text: "This is a message with CTAs. It should take 80% of the max size of a screen. CTAs respect 16px of spacing.", CTA: true)
        let writtenMessage = ItemChatMessageTableViewCell()
        writtenMessage.setup(type: .writter, text: "This is a message of the writter")
        
        let automaticMessage = ItemChatAutomaticTableViewCell()
        automaticMessage.setup(type: .message)
        let automaticCancel = ItemChatAutomaticTableViewCell()
        automaticCancel.setup(type: .cancel)
        let automaticNotification = ItemChatAutomaticTableViewCell()
        automaticNotification.setup(type: .notification)
        let automaticBooked = ItemChatAutomaticTableViewCell()
        automaticBooked.setup(type: .booked)
        
        let automaticActiveInterview = ItemChatAutomaticTableViewCell()
        automaticActiveInterview.setup(type: .activeInterviewDetails)
        let automaticCancelInterview = ItemChatAutomaticTableViewCell()
        automaticCancelInterview.setup(type: .cancelInterviewDetails)
        
        let vc = StoryBookExampleViewController(
            title: "Item Chat ",
            components: [
                .init(title: "Short recipiant message", view: shortMessage),
                .init(title: "Long recipiant message", view: longMessage),
                .init(title: "Writter message", view: writtenMessage),
                
                .init(title: "Automatic message", view: automaticMessage),
                .init(title: "Automatic cancel", view: automaticCancel),
                .init(title: "Automatic notification", view: automaticNotification),
                .init(title: "Automatic booked", view: automaticBooked),
                .init(title: "Automatic active interview", view: automaticActiveInterview),
                .init(title: "Automatic cancel interview", view: automaticCancelInterview),
            ])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
