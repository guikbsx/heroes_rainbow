import UIKit

class DSLaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let list = DSViewController()
        
        list.navigationItem.searchController = nil
        let nav = UINavigationController(rootViewController: list)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            print("You shook me, now what")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
