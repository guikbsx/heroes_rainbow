//
//  ReviewPopupCandidateView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 12/07/2021.
//

import SwiftUI
import Kingfisher

struct ReviewCandidatePopupView: View {
	@State var opacityBackground: Double = 0
	@State var isPresented = false
	
	let candidates: [Candidate]
	let avatar: String
	
	var mainLbl: String {
		return candidates.count > 1 ? "You have \(candidates.count) applicants that require a status update" : "How was the interview with \(candidates[0].name)?"
	}
	var labelBtn: String {
		return candidates.count > 1 ? "Update applicant status" : "Update Status"
	}
	
	var update: () -> Void
	var dismiss: () -> Void
    
	var body: some View {
		VStack {
			Spacer()
			VStack(spacing: 0) {
				ZStack(alignment: .bottom) {
					Rectangle()
						.fill(Color.white)
						.frame(width: UIScreen.main.bounds.width, height: 32+16)
					ZStack {
						ZStack {
							Circle()
								.strokeBorder(Color.white, lineWidth: 4)
								.background(Circle().fill(Color.white))
								.frame(width: 64, height: 64)
							KFImage(URL(string: avatar))
								.placeholder {
									Image(R.image.ios_icon_avatar_default)
										.resizable()
										.frame(width: 58, height: 58)
								}
								.resizable()
								.frame(width: 58, height: 58)
								.cornerRadius(30)
						}
						.offset(x: 16, y: 0)
						ZStack {
							Circle()
								.strokeBorder(Color.white, lineWidth: 4)
								.background(Circle().fill(R.color.purple.color))
							if candidates.count > 1 {
							Text("\(candidates.count)")
								.font(.custom(R.font.riftBoldItalic, size: 40))
								.foregroundColor(.white)
							} else {
								KFImage(URL(string: candidates.last?.avatar ?? ""))
									.placeholder {
										Image(R.image.ios_icon_avatar_default)
											.resizable()
											.frame(width: 58, height: 58)
									}
									.resizable()
									.frame(width: 58, height: 58)
									.cornerRadius(30)
							}
						}
						.frame(width: 64, height: 64)
						.offset(x: -16, y: 0)
					}
					.offset(y:-16)
				}
				VStack {
					Text(mainLbl)
						.font(R.font.riftBoldItalic.swiftUI(size: 24))
						.multilineTextAlignment(.center)
					Button(action: { update() }, label: {
						PrimaryBtnSwiftUI(text: labelBtn, subtext: "", whiteShadow: false, state: .enabled, animated: false)
							.frame(height: 96)
					})
//					.fullScreenCover(isPresented: $isPresented, content: {
//						ReviewFullScreenCandidateView()
//							.background(Color.clear.ignoresSafeArea())
//					})
					Text("update later".uppercased())
						.font(R.font.gilroyBold.swiftUI(size: 16))
						.foregroundColor(R.color.purple.color)
						.padding(.vertical, 24)
						.frame(width: UIScreen.main.bounds.width)
				}
				.background(Color.white.ignoresSafeArea())
			}
		}
		.background(Color.black.opacity(opacityBackground).ignoresSafeArea())
		.animation(.spring().delay(0.2))
		
		.onAppear { opacityBackground = 0.5 }
    }
}

struct ReviewCandidatePopupView_Previews: PreviewProvider {
    static var previews: some View {
		let candidates: [Candidate] = [
			.init(id: 1, name: "Erwan", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista"),
			.init(id: 2, name: "Romain", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista"),
			.init(id: 3, name: "Patrick", avatar: "http://borombo.com/wp-content/uploads/2018/11/LISA1904300227-SOLOX1-EVER-7-min-240x240.jpg", date: Date(), job: "Barista")
		]
		
		ReviewCandidatePopupView(candidates: candidates, avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", update: {}, dismiss: {})
    }
}
