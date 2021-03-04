//
//  ProfileView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 04/03/2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
		ZStack {
			Color.purple
				.edgesIgnoringSafeArea(.all)
			Text("ProfileView")
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
