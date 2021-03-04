//
//  MessageView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 04/03/2021.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
		ZStack {
			Color.blue
				.edgesIgnoringSafeArea(.all)
			Text("MessageView")
		}
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
