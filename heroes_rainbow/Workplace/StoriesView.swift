import SwiftUI
import AVKit

struct StoriesView: View {
	var body: some View {
		
		Home()
	}
}

struct StoriesView_Previews: PreviewProvider {
	static var previews: some View {
		StoriesView()
	}
}

struct Home : View {
	
	@State var index = 0
	@State var top = 0
	@State var data = [
		Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
		Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
		Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
		Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
	]
	
	var body: some View{
		ZStack{
			PlayerScrollView(data: self.$data)
		}
		.background(Color.black.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.all)
	}
}

struct PlayerView : View {
	
	@Binding var data : [Video]
	
	var body: some View{
		VStack(spacing: 0){
			ForEach(0..<self.data.count){i in
				ZStack{
					Player(player: self.data[i].player)
						// full screensize because were going to make paging...
						.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
						.offset(y: -10)
					if self.data[i].replay{
						Button(action: {
							// playing the video again...
							self.data[i].replay = false
							self.data[i].player.seek(to: .zero)
							self.data[i].player.play()
						}) {
							Image(systemName: "goforward")
								.resizable()
								.frame(width: 55, height: 60)
								.foregroundColor(.white)
						}
					}
					
				}
			}
		}
		.onAppear {
			// doing it for first video because scrollview didnt dragged yet...
			self.data[0].player.play()
			self.data[0].player.actionAtItemEnd = .none
			NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
				// notification to identify at the end of the video...
				// enabling replay button....
				self.data[0].replay = true
			}
		}
	}
}

struct Player : UIViewControllerRepresentable {
	
	var player : AVPlayer
	
	func makeUIViewController(context: Context) -> AVPlayerViewController{
		
		let view = AVPlayerViewController()
		view.player = player
		view.showsPlaybackControls = false
		view.videoGravity = .resizeAspectFill
		return view
	}
	
	func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

class Host : UIHostingController<StoriesView>{
	override var preferredStatusBarStyle: UIStatusBarStyle{
		return .lightContent
	}
}

struct Video : Identifiable {
	var id : Int
	var player : AVPlayer
	var replay : Bool
}


struct PlayerScrollView : UIViewRepresentable {
	
	func makeCoordinator() -> Coordinator {
		return PlayerScrollView.Coordinator(parent1: self)
	}
	
	@Binding var data : [Video]
	
	func makeUIView(context: Context) -> UIScrollView{
		let view = UIScrollView()
		let childView = UIHostingController(rootView: PlayerView(data: self.$data))
		// each children occupies one full screen so height = count * height of screen...
		childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
		// same here...
		view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
		view.addSubview(childView.view)
		view.showsVerticalScrollIndicator = false
		view.showsHorizontalScrollIndicator = false
		// to ignore safe area...
		view.contentInsetAdjustmentBehavior = .never
		view.isPagingEnabled = true
		view.delegate = context.coordinator
		return view
	}
	
	func updateUIView(_ uiView: UIScrollView, context: Context) {
		// to dynamically update height based on data...
		uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
		for i in 0..<uiView.subviews.count{
			uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
		}
	}
	
	class Coordinator : NSObject,UIScrollViewDelegate{
		var parent : PlayerScrollView
		var index = 0
		
		init(parent1 : PlayerScrollView) {
			parent = parent1
		}
		
		func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
			
			let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
			
			if index != currenrindex{
				index = currenrindex
				for i in 0..<parent.data.count{
					// pausing all other videos...
					parent.data[i].player.seek(to: .zero)
					parent.data[i].player.pause()
				}
				// playing next video...
				parent.data[index].player.play()
				parent.data[index].player.actionAtItemEnd = .none
				NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
					// notification to identify at the end of the video...
					// enabling replay button....
					self.parent.data[self.index].replay = true
				}
			}
		}
	}
}

// my graphics performance is low....
