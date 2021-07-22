//
//  RequestNotificationsView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/07/2021.
//

import SwiftUI

struct RequestNotificationsView: View {
	
    var body: some View {
		ScrollView {
			VStack(spacing: 12) {
				Image(R.image.handsPhone)
					.padding(.top, 12)
				Text("Hiring managers that accept notifications make hires 3x faster!")
					.padding(20)
					.multilineTextAlignment(.center)
					.font(R.font.gilroyRegular.swiftUI(size: 18))
				Button(action: {
					
				}, label: {
					PrimaryBtnSwiftUI(title: "Turn on notifications", subtitle: nil, state: .constant(.enabled))
				})
				Spacer()
			}
		}
    }
}

struct RequestNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestNotificationsView()
    }
}
