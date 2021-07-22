//
//  RequestCodeView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 21/07/2021.
//

import SwiftUI

struct RequestCodeView: View {
	@EnvironmentObject var model: ConnectionModel
	
    var body: some View {
		VStack {
			if model.actualStepState == .code && !model.isShowingVerificationCode {
				CodeSwiftUI(code: $model.passwordLbl.onChange { value in
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						if value.length >= 4 {
							model.next()
						}
					}
				})
				.animation(.none)
			}
			Spacer()
			Button(action: {
				hideKeyboard()
				model.isShowingVerificationCode.toggle()
			}, label: {
				ItemActionLink(text: "Having trouble? Resend the code.")
			})
		}
    }
}

struct RequestCodeView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
        RequestCodeView()
			.environmentObject(model)
			.onAppear {
				model.actualStepState = .code
			}
    }
}
