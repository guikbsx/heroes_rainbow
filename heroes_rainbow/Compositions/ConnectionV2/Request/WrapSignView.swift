//
//  RequestSignView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 22/07/2021.
//

import SwiftUI

struct WrapSignView: View {
	@EnvironmentObject var model: ConnectionModel

    var body: some View {
		ZStack(alignment: .topLeading) {
			RequestSignInView()
				.environmentObject(model)
				.opacity(model.newUser ? 0 : 1)
			RequestCreatePasswordView()
				.environmentObject(model)
				.opacity(model.newUser ? 1 : 0)
		}
		.background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct RequestSignView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
		WrapSignView()
			.environmentObject(model)
    }
}
