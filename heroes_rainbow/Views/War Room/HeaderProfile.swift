//import SwiftUI
//import RainbowFWK
//import Kingfisher
//
//@available(iOS 14.0, *)
//public struct HeaderProfile: View {
//	
//	var profilePicture: String?
//	var coverPicture: String?
//	var hashtag: String
//	
//	var didTapCoverPicture: () -> Void
//	var didTapProfilePicture: (() -> Void)?
//	var didTapButton1: (() -> Void)?
//	var didTapButton2: (() -> Void)?
//	
//	var button1Icon: Image
//	var button2Icon: Image
//	
//	public init(
//	profilePicture: String? = nil,
//	coverPicture: String? = nil,
//	hashtag: String = "",
//	didTapCoverPicture: @escaping() -> Void = {},
//	didTapProfilePicture: (() -> Void)? = nil,
//	didTapButton1: (() -> Void)? = nil,
//	didTapButton2: (() -> Void)? = nil,
//	button1Icon: Image = Image("f4aa"),
//	button2Icon: Image = Image("f4aa")
//	) {
//		self.profilePicture = profilePicture
//		self.coverPicture = coverPicture
//		self.hashtag = hashtag
//		self.didTapProfilePicture = didTapProfilePicture
//		self.didTapCoverPicture = didTapCoverPicture
//		self.didTapButton1 = didTapButton1
//		self.didTapButton2 = didTapButton2
//		self.button1Icon = Image(R.image.f4aa)
//		self.button2Icon = Image(R.image.f4aa)
//	}
//	
//    public var body: some View {
//		VStack(spacing: -42) {
//			coverPictureView
//			actionButtonView
//		}
//		.buttonStyle(PlainButtonStyle())
//    }
//	
//	var coverPictureView: some View {
//		Button(action: didTapCoverPicture) {
//			ZStack {
//				KFImage(URL(string: coverPicture ?? ""))
//					.placeholder {
//						Color.red500
//						//				Image(R.image.socialProfileCover)
//						//					.resizable()
//						//					.aspectRatio(contentMode: .fill)
//							.frame(height: 142)
//					}
//					.resizable()
//					.aspectRatio(contentMode: .fill)
//					.frame(height: 142)
//					.clipped()
//				if !hashtag.isEmpty && coverPicture == nil {
//					Text("#\(hashtag)")
//						.typography(.header5)
//						.foregroundColor(.black)
//				}
//			}
//		}
//	}
//	
//	var actionButtonView: some View {
//		HStack(alignment: .bottom) {
//			if let _ = didTapProfilePicture {
//				profilePictureView
//			} else {
//				Color.clear.frame(height: 64)
//			}
//			Spacer()
//			if let _ = didTapButton1 { button1View }
//			if let _ = didTapButton2 { button2View }
//		}
//		.padding(.horizontal, 20)
//	}
//	
//	@ViewBuilder
//	var profilePictureView: some View {
//		Button(action: didTapProfilePicture ?? {}) {
//			if let profilePicture = profilePicture {
//				KFImage(URL(string: profilePicture))
//					.placeholder {
//						Avatar(size: 64, plus: true)
//					}
//					.resizable()
//				//				.loadImmediately()
//					.aspectRatio(contentMode: .fill)
//					.frame(width: 64, height: 64)
//					.clipShape(Circle())
//					.addBorder(Color.white, cornerRadius: 100)
//			} else {
//				Avatar(size: 64, plus: true)
//			}
//		}
//	}
//	
//	var button1View: some View {
//		Button(action: didTapButton1 ?? {}) {
//			ZStack {
//				Color.white
//					.frame(width: 48, height: 32)
//					.addBorder(Color.grey100, cornerRadius: 16)
//					.elevation(style: .hills)
//				button1Icon
//				//			Image(R.image.shareSocialIcon)
//					.resizable()
//					.aspectRatio(contentMode: .fit)
//					.frame(width: 16, height: 16)
//					.unredacted()
//			}
//			.padding(4)
//		}
//	}
//	
//	var button2View: some View {
//		Button(action: didTapButton2 ?? {}) {
//			ZStack {
//				Color.white
//					.frame(width: 48, height: 32)
//					.addBorder(Color.grey100, cornerRadius: 16)
//					.elevation(style: .hills)
//				button2Icon
//	//			Image(R.image.penBig)
//					.resizable()
//					.aspectRatio(contentMode: .fit)
//					.frame(width: 16, height: 16)
//					.unredacted()
//			}
//			.padding(4)
//		}
//	}
//}
//
//@available(iOS 14.0, *)
//struct HeaderProfile_Previews: PreviewProvider {
//    static var previews: some View {
//		Group {
//			HeaderProfile(
//				profilePicture: "https://static.wixstatic.com/media/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png/v1/fill/w_163,h_163,q_90/4a9356_2f46a7b44e4d4a3ca99063979ec26f1a~mv2.png",
//				coverPicture: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png",
//				didTapCoverPicture: {
//					
//				},
//				didTapProfilePicture: {
//					
//				},
//				didTapButton1: {
//					
//				},
//				didTapButton2: {
//					
//				}
//			)
//			
//			HeaderProfile(
//				profilePicture: nil,
//				coverPicture: nil,
//				didTapCoverPicture: {
//					
//				},
//				didTapProfilePicture: {
//					
//				},
//				didTapButton1: {
//					
//				},
//				didTapButton2: {
//					
//				}
//			)
//			
//			HeaderProfile(
//				coverPicture: nil,
//				hashtag: "InspiringHeroes",
//				didTapCoverPicture: {
//					
//				},
//				didTapButton1: {
//					
//				}
//			)
//			
//			HeaderProfile(
//				coverPicture: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png",
//				hashtag: "InspiringHeroes",
//				didTapCoverPicture: {
//					
//				},
//				didTapButton1: {
//					
//				}
//			)
//			
//		}
//			.previewLayout(.sizeThatFits)
//    }
//}
