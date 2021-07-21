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
		if model.actualStepState == .code {
			CodeSwiftUI(code: $code)
		} else {
			Text("Waiting")
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
