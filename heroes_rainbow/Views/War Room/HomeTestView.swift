import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HomeTestView: View {
	@State var currentItem: BottomBarCellItem = .social
	
	@State var zIndex: BottomBarCellItem = .social

	var body: some View {
		VStack(spacing: 0) {
			ZStack {
				if currentItem == .social {
					Color.purple500
						.ignoresSafeArea()
				}
				if currentItem == .chat {
					Color.turquoise500
				}
				if currentItem == .me {
					Color.pink500
				}
				if currentItem == .jobs {
					Color.grey500
				}
			}
			BottomBar(currentItem: $currentItem) {
				print("done")
			}
			.animation(.spring().speed(2))
			Color.black.ignoresSafeArea().frame(height: 0)
		}
	}
}

@available(iOS 14.0, *)
struct HomeTestView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTestView()
    }
}
