//import SwiftUI
//import Kingfisher
//import RainbowFWK
//
//public protocol ItemChatListDelegate: NSObject {
//	func didTapSelector(model: ItemChatListModel)
//}
//
//public struct ItemChatList: View {
//	
//	var model: ItemChatListModel
//	var message: String
//	var unread: Bool
//	var isCompany: Bool
//	weak var delegate: ItemChatListDelegate?
//	
//	public init(model: ItemChatListModel, message: String, unread: Bool, isCompany: Bool = false, delegate: ItemChatListDelegate? = nil) {
//		self.model = model
//		self.message = message
//		self.unread = unread
//		self.delegate = delegate
//		self.isCompany = isCompany
//	}
//	
//	public var body: some View {
//		VStack(spacing: 0) {
//			HStack(spacing:8) {
//				ZStack {
//					KFImage(URL(string: model.candidate.avatar ?? ""))
//						.placeholder {
//							Avatar(size: 56)
//						}
//						.resizable()
//						.aspectRatio(contentMode: .fill)
//						.frame(width: 56, height: 56)
//						.cornerRadius(28)
//					ZStack {
//						Circle()
//							.fill(Color.white)
//							.frame(width: 24, height: 24)
//						Circle()
//							.fill(Color.lightRedDS)
//							.frame(width: 16, height: 16)
//					}.offset(x: 20, y: -20)
//					.opacity(unread ? 1 : 0)
//					.animation(.spring(), value: unread)
//				}
//				VStack(alignment: .leading, spacing: 0) {
//					if !isCompany {
//					Text(model.jobs.count == 1 ? model.jobs.first!.name.uppercased() : "TEAM MEMBER")
//						.typography(.caption)
//						.foregroundColor(.purple500)
//					}
//					HStack(alignment: .center) {
//						Text(model.candidate.name)
//							.typography(.subtitleS)
//							.foregroundColor(.black)
//						if isCompany {
//							Circle().fill(Color.purple500)
//								.frame(width: 16, height: 16)
//								.offset(y: -1)
//						}
//					}
//					Text(message)
//						.typography(.bodyXS)
//						.foregroundColor(.blueGreyDS)
//						.lineLimit(1)
//				}
//				Spacer()
//				if let _ = delegate {
//					Button(action: { delegate?.didTapSelector(model: model) }, label: {
//						Spacer()
//							.frame(width: 20)
//						VStack(spacing: 4) {
//							Circle()
//								.fill(Color.lightBlueGreyDS)
//								.frame(width: 4, height: 4)
//							Circle()
//								.fill(Color.lightBlueGreyDS)
//								.frame(width: 4, height: 4)
//							Circle()
//								.fill(Color.lightBlueGreyDS)
//								.frame(width: 4, height: 4)
//						}
//						.frame(height: 50)
//					})
//				}
//			}
//			.padding(.vertical, 16)
//			Rectangle()
//				.fill(Color.lightBlueGreyDS)
//				.frame(height: 0.5)
//		}
//		.padding(.horizontal, 20)
//	}
//}
//
//struct ItemChatList_Previews: PreviewProvider {
//	static var previews: some View {
//		Group {
//			ItemChatList(
//				model: ItemChatListModel(
//					id: 0,
//					candidate: ItemChatListCandidate(
//						id: 0,
//						name: "Nabile Chopin",
//						avatar: ""
//					),
//					jobs: [.init(id: 0, name: "Back of house")],
//					interviewDate: Date()),
//				message: "Did you have more information ?",
//				unread: false
//			)
//			ItemChatList(
//				model: ItemChatListModel(
//					id: 0,
//					candidate: ItemChatListCandidate(
//						id: 0,
//						name: "Kaleb Aubuchon",
//						avatar: "https://assets.heroes.jobs/users/119086/avatar1625771174.jpg"
//					),
//					jobs: [.init(id: 0, name: "Product Manager")],
//					interviewDate: Date()),
//				message: "I'm quiet nervous ... But I'm ready to give everything I have !",
//				unread: false
//			)
//			ItemChatList(
//				model: ItemChatListModel(
//					id: 0,
//					candidate: ItemChatListCandidate(
//						id: 0,
//						name: "Pantéa Négui",
//						avatar: "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png"
//					),
//					jobs: [.init(id: 0, name: "Product Manager")],
//					interviewDate: Date()),
//				message: "I love this jobs !",
//				unread: true
//			)
//			ItemChatList(
//				model: ItemChatListModel(
//					id: 0,
//					candidate: ItemChatListCandidate(
//						id: 0,
//						name: "Jozadak",
//						avatar: "https://assets.heroes.jobs/medias/6084/1637227980488.png"
//					),
//					jobs: [],
//					interviewDate: Date()),
//				message: "I hope you like my last video !",
//				unread: false,
//				isCompany: true
//			)
//			ItemChatList(
//				model: ItemChatListModel(
//					id: 0,
//					candidate: ItemChatListCandidate(
//						id: 0,
//						name: "Chiptole",
//						avatar: "https://assets.heroes.jobs/medias/21/Chipotle_logo.jpg"
//					),
//					jobs: [],
//					interviewDate: Date()),
//				message: "This is the last message",
//				unread: true,
//				isCompany: true
//			)
//		}
//		.previewLayout(.sizeThatFits)
//	}
//}
