import SwiftUI
import RainbowFWK
import Lottie

struct LoaderView: View {
	let lottie = LottieView(animation: AnimationView(name: .loading))
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Loader")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Circular loader", settings: {}, content: {
				lottie
					.frame(height: 100)
					.onAppear {
						lottie.play()
						lottie.animation.loopMode = .loop
					}
			})
		}
	}
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
