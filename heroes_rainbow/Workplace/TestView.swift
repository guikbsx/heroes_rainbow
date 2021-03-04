//
//  TestView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 04/03/2021.
//

import SwiftUI
import iPages

struct TestView: View {
	@State private var selection = 1
	
	var body: some View {
		_PagingView(
			config: _PagingViewConfig(
				direction: .horizontal,
				size: nil,
				margin: 0,
				spacing: 0,
				constrainedDeceleration: true
			),
			page: $selection,
			views: [
				AnyView(MessageView()),
				AnyView(StoriesView()),
				AnyView(ProfileView()),
			]
		)
	}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
