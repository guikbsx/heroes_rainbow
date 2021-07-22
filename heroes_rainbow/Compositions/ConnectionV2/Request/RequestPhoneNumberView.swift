//
//  RequestPhoneNumberView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 21/07/2021.
//

import SwiftUI

struct RequestPhoneNumberView: View {
	@EnvironmentObject var model: ConnectionModel
	
	@State var buttonState: PrimaryBtnState = .disabled
	@State var isValidNumber: Bool = false

    var body: some View {
		ScrollView {
			VStack {
				InputPhoneSwiftUI(phoneNumber: $model.phoneNumberLbl)
					.frame(height: 78)
				PrimaryBtnSwiftUI(title: "Send Code", subtitle: nil, state: $buttonState, onTap: {
					hideKeyboard()
					model.next()
				})
			}
		}
    }
}

struct RequestPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ConnectionModel()
        RequestPhoneNumberView()
			.environmentObject(model)
    }
}
