//
//  ReviewFullScreenCandidateView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 12/07/2021.
//

import SwiftUI

struct ReviewCandidateData {
	var offset: CGFloat
	var scaleEffect: CGFloat
	var opacity: Double
	@State var candidate: Candidate
}

struct ReviewCandidateFullView: View {
	@State var opacityBackground: Double = 0
	@State var state: Bool = true
	
	@State var card1: ReviewCandidateData? = nil
	@State var card2: ReviewCandidateData? = nil
	
	@State var lastCandidate: Int = 1
	@State var candidates: [Candidate]
	var avatar: String
	
    var body: some View {
		VStack {
			Spacer()
			ZStack {
				if let _ = card2 {
					ReviewCandidateContentView(candidate: card2!.candidate, avatar: avatar, skip: {animate()}, choice: {animate()})
						.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
						.scaleEffect(card2!.scaleEffect, anchor: .top)
						.offset(y: card2!.offset)
						.opacity(card2!.opacity)
						.zIndex(state ? 0 : 1)
				}
				
				if let _ = card1 {
					ReviewCandidateContentView(candidate: card1!.candidate, avatar: avatar, skip: {animate()}, choice: {animate()})
						.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
						.scaleEffect(card1!.scaleEffect, anchor: .top)
						.offset(x: 0, y: card1!.offset)
						.opacity(card1!.opacity)
						.zIndex(state ? 1 : 0)
				}
			}
			.animation(.spring().speed(2))
		}
		.ignoresSafeArea()
		.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
		.background(Color.black.opacity(opacityBackground).ignoresSafeArea())
		.animation(.spring())
		
		.onAppear {
			opacityBackground = 0.5
			
			card1 = ReviewCandidateData(offset: 0, scaleEffect: 1, opacity: 1, candidate: candidates[0])
			if candidates.count > 1 {
				card2 = ReviewCandidateData(offset: -20, scaleEffect: 0.95, opacity: 0.5, candidate: candidates[1])
			} else {
				card2?.opacity = 0
			}
		}
	}
	
	func animate() {
		guard lastCandidate != candidates.count else { return }
		
		lastCandidate += 1
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
			
			if state {
				//Card 1 — FRONT GO TO BACK
				card1?.offset = UIScreen.main.bounds.height
				if lastCandidate != candidates.count {
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
						card1?.offset = -20
						card1?.scaleEffect = 0.95
						card1?.opacity = 0.5
					})
					
					//Charge new information
					card1?.candidate = candidates[lastCandidate]
				}
				
				//Card 2 — BACK GO TO FRONT
				card2?.opacity = 1
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
					card2?.offset = 0
					card2?.scaleEffect = 1
				})
			} else {
				//Card 1 — BACK GO TO FRONT
				card1?.opacity = 1
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
					card1?.offset = 0
					card1?.scaleEffect = 1
				})
				
				//Card 2 — FRONT GO TO BACK
				card2?.offset = UIScreen.main.bounds.height
				if lastCandidate != candidates.count {
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
						card2?.offset = -20
						card2?.scaleEffect = 0.95
						card2?.opacity = 0.5
						
						//Charge new information
						card2?.candidate = candidates[lastCandidate]
					})
				}
			}
			
			//Change state
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
				state.toggle()
			})
		})
	}
}

struct ReviewCandidateFullView_Previews: PreviewProvider {
    static var previews: some View {
		let candidates: [Candidate] = [
			.init(id: 1, name: "Erwan", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista"),
			.init(id: 2, name: "Romain", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista"),
			.init(id: 3, name: "Patrick", avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png", date: Date(), job: "Barista")
		]
		
		ReviewCandidateFullView(candidates: candidates, avatar: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png")
			.background(Color.black.ignoresSafeArea())
    }
}
