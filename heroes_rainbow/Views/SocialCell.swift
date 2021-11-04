import SwiftUI
import RainbowFWK
import AVKit

struct SocialCell: View {

	init(url: String) {
		self.player = AVPlayer(url: URL(string: url)!)
	}
	
	@State var player: AVPlayer
	
    var body: some View {
		PlayerView(player: $player, didFinishVideo: {
			player.seek(to: .zero)
		})
		.onAppear {
			player.play()
		}
		.onDisappear {
			player.pause()
		}
    }
}

struct SocialCell_Previews: PreviewProvider {
    static var previews: some View {
		SocialCell(url: "")
    }
}
