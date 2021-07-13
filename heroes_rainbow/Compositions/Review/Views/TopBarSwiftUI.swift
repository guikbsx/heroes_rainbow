//
//  TopBarSwiftUI.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 07/07/2021.
//

import SwiftUI

struct TopBarSwiftUI: View {
	var skipBtn: () -> Void
	
    var body: some View {
		HStack {
			Spacer()
			Button(action: {skipBtn()}, label: {
				Text("Skip")
					.font(R.font.gilroyBold.swiftUI(size: 14))
					.foregroundColor(.white)
					.padding(.vertical, 8)
					.padding(.horizontal, 16)
					.background(R.color.purple.color)
					.cornerRadius(16)
			})
		}
		.padding(.vertical, 16)
		.padding(.horizontal, 20)

    }
}

struct TopBarSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
		TopBarSwiftUI(skipBtn: {})
			.previewLayout(.sizeThatFits)
    }
}
