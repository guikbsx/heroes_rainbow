//
//  VerificationCodeView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/07/2021.
//

import SwiftUI

struct VerificationCodeView: View {
	@EnvironmentObject var model: ConnectionModel

    var body: some View {
		ScrollView {
			VStack {
				TopBarSwiftUI(component: .init(left: .none, middle: .none, right: .close), rightBtn: {model.isShowingVerificationCode.toggle()})
				PageTitle(title: "A team member will call you soon to assist you!")
				Image(R.image.happyBunchPhone)
				Text("Don’t worry, we’re here for you.")
					.padding(20)
					.multilineTextAlignment(.center)
					.font(R.font.gilroyRegular.swiftUI(size: 18))
				Spacer()
			}
		}
		.background(Color.white.edgesIgnoringSafeArea(.all))
	
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
		
        VerificationCodeView()
			.environmentObject(model)
    }
}
