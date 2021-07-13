//
//  TopBarSwiftUI.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 07/07/2021.
//

import SwiftUI

enum TopBarLeft { case back, none }
enum TopBarMiddle { case label, none }
enum TopBarRight { case close, skip, none }

struct TopBarStruct {
	let left: TopBarLeft
	let middle: TopBarMiddle
	let right: TopBarRight
}

struct TopBarSwiftUI: View {
	var component: TopBarStruct = .init(left: .back, middle: .none, right: .skip)
	
	var leftBtn: (() -> Void)? = nil
	var rightBtn: (() -> Void)? = nil
	var skipLbl: String = "Skip"
	var centerLbl: String = ""
	
	
    var body: some View {
		HStack {
			if component.left == .back {
				Button(action: { leftBtn?() }, label: {
					Image(R.image.back)
						.resizable()
						.frame(width: 32, height: 32)
				})
			}
			
			Spacer()
			Text(centerLbl)
				.font(R.font.gilroyMedium.swiftUI(size: 18))
				.foregroundColor(R.color.blueGrey.color)
			Spacer()
			if component.right == .skip {
				Button(action: { rightBtn?() }, label: {
					Text(skipLbl)
						.font(R.font.gilroyBold.swiftUI(size: 14))
						.foregroundColor(.white)
						.padding(.vertical, 8)
						.padding(.horizontal, 16)
						.background(R.color.purple.color)
						.cornerRadius(16)
				})
			} else if component.right == .close {
				Button(action: { leftBtn?() }, label: {
					Image(R.image.close)
						.resizable()
						.frame(width: 32, height: 32)
				})
			}
		}
		.padding(.vertical, 16)
		.padding(.horizontal, 20)

    }
}

struct TopBarSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
		TopBarSwiftUI(rightBtn: {})
			.previewLayout(.sizeThatFits)
    }
}
