//
//  ReviewCandidateModel.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 12/07/2021.
//

import Foundation
import UIKit
import SwiftUI

struct Candidate {
	let id: Int
	let name: String
	let avatar: String
	let date: Date
	let job: String
}

struct ReviewCandidateData {
	var offset: CGFloat
	var scaleEffect: CGFloat
	var opacity: Double
	@State var candidate: Candidate
}
