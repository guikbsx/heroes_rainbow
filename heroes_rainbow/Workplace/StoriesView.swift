import SwiftUI
import AVKit

struct StoriesView: View {
    var body: some View {
		ZStack {
			Color.green
				.edgesIgnoringSafeArea(.all)
			Text("StoriesView")
		}
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
