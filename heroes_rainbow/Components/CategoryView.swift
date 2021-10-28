//
//  CategoryView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 25/10/2021.
//

import SwiftUI

struct CategoryView: View {
	var label: String
	init(_ label: String) {
		self.label = label
	}
	
    var body: some View {
        Text(label)
			.gilroyFont(style: .bold, size: 12, color: .white)
			.padding(8)
			.background(Color.purple500)
			.cornerRadius(8)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView("Foundations")
			.previewLayout(.sizeThatFits)
    }
}
