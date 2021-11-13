//
//  ItemNamingSocialSwiftUI.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 03/11/2021.
//

import SwiftUI
import RainbowFWK

struct StressTestView: View {
    var body: some View {
		Text("hello")
    }
	
	func textWithHashtags(color: Color) -> Text {
		let text = "This is a test #hello #you #thisisatest That's cool"
		let words = text.split(separator: " ")
		var output: Text = Text("")
		
		for word in words {
			if word.hasPrefix("#") { // Pick out hash in words
				output = output + Text(" ") + Text(String(word))
					// Add custom styling here
					.foregroundColor(color)
			} else {
				output = output + Text(" ") + Text(String(word))
			}
		}
		return output
	}
}

struct StressTestView_Previews: PreviewProvider {
    static var previews: some View {
		StressTestView()
			.previewLayout(.sizeThatFits)
			.background(Color.black)
    }
}
