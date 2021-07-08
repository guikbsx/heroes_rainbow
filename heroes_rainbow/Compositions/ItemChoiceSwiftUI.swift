//
//  ItemChoiceSwiftUI.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 07/07/2021.
//

import SwiftUI

struct ItemChoiceSwiftUI: View {
	var text: String
	@State var selected: Bool = false
	var onTap: () -> Void
	
	var lightBlueGrey = R.color.lightBlueGrey.color.opacity(0.25)
	var purple = R.color.purple.color
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 36)
				.fill(Color.white)
				.frame(height: 53)
				.overlay(
					ZStack {
						HStack {
							ZStack {
								if selected { Image(R.image.check) }
								Image(R.image.checkBox)
							}
							Text(text)
								.font(R.font.gilroyBold.swiftUI(size: 16))
								.foregroundColor(R.color.purple.color)
							Spacer()
						}
						.padding(.horizontal, 24)
						.padding(.vertical, 16)
						RoundedRectangle(cornerRadius: 36)
							.stroke(purple, lineWidth: selected ? 1 : 0)
					}
				)
				.shadow(color: selected ? purple.opacity(0.25) : lightBlueGrey, radius: 12, x: 0, y: 2)
				.padding(.horizontal, 20)
				.padding(.vertical, 8)
				.onTapGesture {
					selected.toggle()
					onTap()
				}
				.animation(.spring().speed(1.25))
		}
		
		
		
//		HStack {
//			ZStack {
//				Image(R.image.check)
//				Image(R.image.checkBox)
//			}
//			Text(text)
//				.font(R.font.gilroyBold.swiftUI(size: 16))
//				.foregroundColor(R.color.purple.color)
//			Spacer()
//		}
//		.padding(.horizontal, 24)
//		.padding(.vertical, 16)
//		.overlay(
//			RoundedRectangle(cornerRadius: 36)
//				.stroke(R.color.purple.color, lineWidth: selected ? 1 : 0)
//		)
//		.padding(.horizontal, 20)
//		.padding(.vertical, 8)
		
	}
}

struct ItemChoiceSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
		ItemChoiceSwiftUI(text: "Offer made", onTap: {})
//			.previewLayout(.sizeThatFits)
    }
}
