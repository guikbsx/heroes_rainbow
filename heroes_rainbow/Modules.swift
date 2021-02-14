import UIKit

extension HomeViewController {
    
    func configureModules(_ indexPath: IndexPath) {
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        
        case .moduleVideo:
            let vc = ModuleVideoViewController(emoji: "😎", question: "How would you deal with an angry customer? Give one example that you experienced.")
            self.navigationController?.pushViewController(vc, animated: true)
            
        default: break
        }
    }
    
}
