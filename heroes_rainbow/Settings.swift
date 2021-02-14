import UIKit
import Lottie

extension HomeViewController {
    
    func configureSettings(_ indexPath: IndexPath) {
        
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        /*Settings*/
        case .colors:
            var colorView: [StoryBookPackage] = []
            designSystemsColor.forEach { color in
                let cell = ItemAction()
                cell.setupAsColorCell(name: "", backgroundColor: color.backgroundColor, textColor: .black)
                colorView.append(.init(title: "\(color.name) #\(color.hex)", view: cell, color: color.backgroundColor))
            }
            let vc = StoryBookExampleViewController(title: "Colors", components: colorView)
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .lottie:
            let loading = AnimationView(name: "loading")
            let check = AnimationView(name: "check")
            let thumbup = AnimationView(name: "thumbup")
            let confetti = AnimationView(name: "confetti")
            
            [confetti, loading, check, thumbup].forEach { animation in
                animation.play()
                animation.loopMode = .loop
            }
            
            let vc = StoryBookExampleViewController(
                title: "Animations",
                components: [
                    .init(title: "Loading", view: loading),
                    .init(title: "Check", view: check, color: R.color.boldGrey()!),
                    .init(title: "Thumb up", view: thumbup),
                    .init(title: "Confetti", view: confetti),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        default:
            break
        }
        
    }
}
