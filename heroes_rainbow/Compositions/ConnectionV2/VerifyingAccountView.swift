//
//  VerifyingAccountView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/07/2021.
//

import SwiftUI

struct VerifyingAccountView: View {
    var body: some View {
		VStack {
			PageTitle(title: "Sit tight, A team MEMBER will contact you shortly!")
			Image(R.image.dayflowWorkFromHome)
			Text("We’re activating your account.")
				.padding(20)
				.multilineTextAlignment(.center)
				.font(R.font.gilroyRegular.swiftUI(size: 18))
			Spacer()
		}
		
    }
}

struct VerifyingAccountView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyingAccountView()
    }
}
