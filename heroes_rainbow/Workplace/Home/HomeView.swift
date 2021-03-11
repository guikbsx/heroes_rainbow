//
//  TestView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 04/03/2021.
//

import SwiftUI

struct HomeView: View {
	
	@State var selectedIndex = 1
	
	let tabBarImageNames = [R.image.deleteIcon, R.image.penIcon, R.image.rateIcon]
	
	var body: some View {

		ZStack {
			switch selectedIndex {
				case 0:
					MessageView()
				case 1:
					StoriesView()
				default:
					ProfileView()
			}
			VStack {
				Spacer()
				HStack {
					ForEach(0..<tabBarImageNames.count) { num in
						Button(action: {
							selectedIndex = num
						}, label: {
							Spacer()
							Image(tabBarImageNames[num])
								.frame(height: 24, alignment: .center)
								.accentColor(.white)
							Spacer()
						})
					}
				}
				.padding(.top, 16)
				.padding(.bottom, 40)
				.background(Color.black)
			}
		}
		.background(Color.black)
		.edgesIgnoringSafeArea(.all)

	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
    }
}
