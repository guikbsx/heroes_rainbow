import UIKit

extension HomeViewController {
    
    func configureModules(_ indexPath: IndexPath) {
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        
        case .moduleVideo:
            let vc = ModuleVideoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default: break
        }
    }
    
}
