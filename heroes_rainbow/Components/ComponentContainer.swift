//
//  ComponentContainer.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 03/11/2021.
//

import SwiftUI

struct ComponentContainer<Settings: View, Content: View> : View {
	var title: String
	var settings: Settings
	var content: Content
	
	init(title: String, @ViewBuilder settings: () -> Settings, @ViewBuilder content: () -> Content) {
		self.title = title
		self.content = content()
		self.settings = settings()
	}
	
    var body: some View {
		VStack {
			HStack {
				Text(title)
					.typography(.subtitleXS)
				Spacer()
			}
			.padding(.horizontal, 20)
			if #available(iOS 14.0, *) {
				settings
					.padding(12)
					.background(Color.grey100.cornerRadius(8))
					.padding(.horizontal, 20)
					.pickerStyle(SegmentedPickerStyle())
					.toggleStyle(SwitchToggleStyle(tint: .purple500))
					.onAppear {
						UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.purple500)
						UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
					}
			}
			content
				.background(Color.white)
		}
		.background(Color.white100)
		.padding(.vertical)
    }
}

struct ComponentContainer_Previews: PreviewProvider {
    static var previews: some View {
		ComponentContainer(
			title: "Primary Button",
			settings: {
				Text("Here can go some settings... Or not !")
			},
			content: {
				RoundedRectangle(cornerRadius: 20)
					.frame(height: 100)
			}
		)
		.previewLayout(.sizeThatFits)
    }
}
