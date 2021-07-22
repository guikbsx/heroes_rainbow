//
//  RequestCodeView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 21/07/2021.
//

import SwiftUI

struct RequestCodeView: View {
	@EnvironmentObject var model: ConnectionModel

	@State var code: String = ""
	
    var body: some View {
		VStack {
			if model.actualStepState == .code {
				CodeSwiftUI(code: $code.onChange { value in
					
				})
				.animation(.none)
			}
			Spacer()
			Button(action: { }, label: {
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
