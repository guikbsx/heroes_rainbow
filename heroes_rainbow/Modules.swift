import UIKit

extension HomeViewController {
    
    func configureModules(_ indexPath: IndexPath) {
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        
        case .moduleVideo:
            let vc = ModuleVideoViewController(emoji: "😎", question: "What’s your greatest strength and explain why?\nWhat’s your greatest strength and explain why?")
            self.navigationController?.pushViewController(vc, animated: true)
            
        default: break
        }
    }
    
}
