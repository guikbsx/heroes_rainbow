//
//  SuccessPageView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 14/04/2022.
//

import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct SuccessPageView: View {
	
	@State var isShowingSuccessPage: Bool = false
	
    var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Organism", title: "Success Page")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
		.fullScreenCover(isPresented: $isShowingSuccessPage) {
			SuccessView(
				title: "Experience added to your profile",
				subtitle: "Life is made of experiences.",
				btnTitle: "Back to my profile"
			)
		}
    }
	
	var content: some View {
		ScrollView {
			SecondaryBtn(type: .secondary, text: "Pop success page") {
				isShowingSuccessPage.toggle()
			}
		}
	}
}

@available(iOS 14.0, *)
struct SuccessPageView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPageView()
    }
}
