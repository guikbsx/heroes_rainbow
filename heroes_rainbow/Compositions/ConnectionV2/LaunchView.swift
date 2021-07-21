//
//  LaunchView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 15/07/2021.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
		ZStack {
			Image(R.image.graphic_overlay_no_alpha)
				.edgesIgnoringSafeArea(.all)
			VStack {
				Spacer()
				Text("Launch")
				Spacer()
			}
		}
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
