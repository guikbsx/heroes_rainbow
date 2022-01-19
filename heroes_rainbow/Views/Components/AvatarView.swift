//
//  AvatarView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/12/2021.
//

import SwiftUI
import RainbowFWK

struct AvatarView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Avatar")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var plus: Bool = false
	
	var content: some View {
		ComponentContainer(
			title: "Avatar",
			settings: {
				Toggle(isOn: $plus, label: { Text("Plus").typography(.bodyXS) })
			},
			content: {
				Avatar(size: 64, plus: plus)
					.animation(.spring(), value: plus)
			}
		)
	}
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
