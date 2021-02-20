import UIKit

extension HomeViewController {
    func setupItemAction() {
        let actionCell = ItemAction()
        actionCell.setup(name: "Add a hiring event", image: R.image.addButton()!)
        
        let unableCell = ItemAction()
        unableCell.setup(name: "30 min per candidate", image: R.image.periodIcon()!)
        unableCell.state(.disabled)
        
        let infoCell = ItemAction()
        infoCell.setup(name: "Nov. 19", interval: "11:45AM - 13:45AM", image: R.image.storeIcon()!)
        
        let linkCell = ItemAction()
        linkCell.setupAsLink(text: "This is a link")
        
        let deleteCell = ItemAction()
        deleteCell.setupAsDelete(text: "Delete label 🗑")
        
        let experienceCell = ItemActionLarge()
        experienceCell.setup(title: "Barista", subtitle: "Jack in the box", info: "3 months")
        
        let vc = StoryBookExampleViewController(
            title: "Item Action",
            components: [
                .init(title: "Active item", view: actionCell),
                .init(title: "Unactive item", view: unableCell),
                .init(title: "Active item with info", view: infoCell),
                .init(title: "Delete item", view: deleteCell),
                .init(title: "Link item", view: linkCell),
                .init(title: "Large item", view: experienceCell)
            ])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
