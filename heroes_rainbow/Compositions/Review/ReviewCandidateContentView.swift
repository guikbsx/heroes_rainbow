//
//  ReviewCandidateContentView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 12/07/2021.
//

import SwiftUI
import Kingfisher
import SwiftDate

struct ReviewCandidateContentView: View {
	@State var candidate: Candidate
	var avatar: String
	var skip: () -> Void
	var choice: () -> Void
	
	var choices: [String] = ["Offer made", "No show", "Turned the applicant down", "Applicant is no longer interested"]
	@State var selected : [Bool] = [false, false, false, false, false]
	
    var body: some View {
		RoundedCorners(color: .white, tl: 20, tr: 20, bl: 0, br: 0)
			.overlay(
				VStack {
					TopBarSwiftUI(skipBtn: {skip()})
					NewVoice(text: "How did the interview go?")
					circleView
					subtitleView
					ScrollView {
						LazyVStack(spacing: 0) {
							ForEach(choices.indices, id: \.self) { indice in
								ItemChoiceSwiftUI(text: choices[indice], selected: $selected[indice], onTap: {
									self.choice()
									DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
										selected[indice].toggle()
									})
								})
							}
						}
					}
					Spacer()
				}
				.padding(.top, 16)
			)
		
    }
	
	var circleView: some View {
		ZStack {
			ZStack {
				Circle()
					.strokeBorder(Color.white, lineWidth: 4)
					.background(Circle().fill(Color.white))
					.frame(width: 64, height: 64)
				KFImage(URL(string: avatar))
					.resizable()
					.frame(width: 60, height: 60)
					.cornerRadius(30)
			}
			.offset(x: 16, y: 0)
			ZStack {
				Circle()
					.strokeBorder(Color.white, lineWidth: 4)
					.background(Circle().fill(Color.white))
				KFImage(URL(string: candidate.avatar))
						.resizable()
						.frame(width: 60, height: 60)
						.cornerRadius(30)
			}
			.frame(width: 64, height: 64)
			.offset(x: -16, y: 0)
		}
	}
	
	var subtitleView: some View {
		Text("You interviewed \(candidate.name ) on \(candidate.date.toFormat("MMM dd")) for position as \(candidate.job).")
			.font(R.font.gilroyMedium.swiftUI(size: 18))
			.foregroundColor(R.color.blueGrey.color)
			.multilineTextAlignment(.center)
			.padding(16)
	}
}

struct ReviewCandidateContentView_Previews: PreviewProvider {
    static var previews: some View {
		ReviewCandidateContentView(
			candidate:
				.init(id: 1, name: "Erwan", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista"),
			avatar:
				"https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png",
			skip: {
			
			},
			choice: {
			
			})
    }
}
