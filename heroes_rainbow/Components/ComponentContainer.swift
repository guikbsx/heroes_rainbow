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
					.rainbowToggle()
					.pickerStyle(SegmentedPickerStyle())
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
import RainbowFWK
struct ComponentContainer_Previews: PreviewProvider {
    static var previews: some View {
		ScrollView {
			ComponentContainer(
				title: "Primary Button",
				settings: {
					Toggle(isOn: .constant(true), label: { Text("Label").typography(.bodyXS) })
				},
				content: {
					PrimaryBtnSwiftUI(title: "Hello", subtitle: nil, state: .constant(.enabled))
				}
			)
			.previewLayout(.sizeThatFits)
			ComponentContainer(
				title: "Secondary Button",
				settings: {
					VStack {
						Toggle(isOn: .constant(false), label: { Text("Label").typography(.bodyXS) })
						Toggle(isOn: .constant(false), label: { Text("Label").typography(.bodyXS) })
						Toggle(isOn: .constant(false), label: { Text("Label").typography(.bodyXS) })
						Toggle(isOn: .constant(false), label: { Text("Label").typography(.bodyXS) })
					}
				},
				content: {
					VStack {
						SecondaryBtn(type: .secondary, text: "Hello") {}
					}
				}
			)
		}
		.previewLayout(.sizeThatFits)
    }
}
