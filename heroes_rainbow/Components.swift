import UIKit

extension HomeViewController {
    
    func configureComponents(_ indexPath: IndexPath) {
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        /*Components*/
        case .button:
            let vc = StoryBookExampleViewController(
                title: "Buttons",
                components: [
                    .init(title: "Disabled state",      view: PrimaryBtn(text: "OK", state: .disabled)),
                    .init(title: "Enabled state",       view: PrimaryBtn(text: "Confirm Change", state: .enabled)),
                    .init(title: "Loading state",       view: PrimaryBtn(text: "OK", state: .loading)),
                    .init(title: "Final step state (click to activate)", view: PrimaryBtn(text: "Submit", whiteShadow: true, state: .enabled, animated: true), color: R.color.boldGrey()!),
                    .init(title: "Trucated text",       view: PrimaryBtn(text: "This is a way to long text to be displayed", state: .enabled)),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .input:
            let vc = FieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .theVoice:
            let vc = TheVoiceViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .zoom
            self.present(vc, animated: true)
            break
            
        case .itemAction:
            setupItemAction()
            break
            
        case .itemChoice:
            let unselectedChoice = ItemChoice()
            unselectedChoice.setup(label: "This is a choice", selected: false)
            let selectedChoice = ItemChoice()
            selectedChoice.setup(label: "This is another choice", selected: true)
            
            let vc = StoryBookExampleViewController(
                title: "Item Choice",
                components: [
                    .init(title: "Unselected choice", view: unselectedChoice),
                    .init(title: "Selected choice", view: selectedChoice),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .topBar:
            let vc = StoryBookExampleViewController(
                title: "Top Bar",
                components: [
                    .init(title: "Bar with close button", view: TopBar(backBtn: false, actionBtn: .close)),
                    .init(title: "Bar with back button", view: TopBar(backBtn: true)),
                    .init(title: "Bar with back and skip button", view: TopBar(backBtn: true, actionBtn: .skip)),
                    .init(title: "Bar with back and left custom button", view: TopBar(backBtn: true, actionBtn: .custom, customActionLbl: "Delete")),
                    .init(title: "Bar with left and right button and text between us", view: TopBar(backBtn: true, text: "This is an info",actionBtn: .skip)),
                    .init(title: "Custom bar", view: TopBar(backBtn: true, customActionLbl: "See example")),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .menuBar:
            let vc = StoryBookExampleViewController(
                title: "Menu Bar",
                components: [
                    .init(title: "Menu bar", view: MenuBar(text: "Filter", counter: 0), color: .black),
                    .init(title: "Menu bar with activate filter", view: MenuBar(text: "Filter", counter: 3), color: .black),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .divider:
            let vc = StoryBookExampleViewController(
                title: "Divider",
                components: [
                    .init(title: "Divider without text", view: Divider()),
                    .init(title: "Divider with short text", view: Divider(text: "or")),
                    .init(title: "Divider with long text", view: Divider(text:"or show me jobs"))
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .autocomplete:
            let geolocCell = AutocompleteGeoloc()
            let addressCell = AutocompleteAddress()
            addressCell.setup(address: NSAttributedString(string:"1 Apple Park Way"), city: NSAttributedString(string: "Cupertino, CA 95014"))
            
            let vc = StoryBookExampleViewController(
                title: "Autocomplete",
                components: [
                    .init(title: "Autocomplete with geolocalisation", view: geolocCell, color: .white),
                    .init(title: "Autocomplete with address", view: addressCell, color: .white),])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .calendar:
            let vc = CalendarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .time:
            let vc = StoryBookExampleViewController(
                title: "Time Picker",
                components: [
                    .init(title: "", view: TimePicker(date: Date(), duration: 15)),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .modal:
            let modalBtn = PrimaryBtn(text: "Activate Popup", state: .enabled)
            modalBtn.delegate = self
            modalBtn.optionalTag = 0
            let vc = StoryBookExampleViewController(
                title: "Modal",
                components: [
                    .init(title: "", view: modalBtn)
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .itemVideo:
            let vc = StoryBookExampleViewController(
                title: "Item Video",
                components: [
                    .init(title: "Item Video Rec", view: ItemVideoRec(), color: R.color.boldGrey()!),
                    .init(title: "Item Video Edit Retry", view: ItemVideoEdit(type: .retry), color: R.color.boldGrey()!),
                    .init(title: "Item Video Edit Ok", view: ItemVideoEdit(type: .validate), color: R.color.boldGrey()!),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .itemChat:
			let vc = TableViewController()
			self.navigationController?.pushViewController(vc, animated: true)
//            configureItemChat()
            break
            
        case .itemInfo:
            let vc = StoryBookExampleViewController(
                title: "Item Info",
                components: [
                    .init(title: "Arm", view: ItemInfo(.arm)),
                    .init(title: "Eyes", view: ItemInfo(.eyes)),
                    .init(title: "Lightbulb", view: ItemInfo(.lightbulb)),
                    .init(title: "Monkey", view: ItemInfo(.monkey)),
                    .init(title: "Smile", view: ItemInfo(.smile)),
                    .init(title: "Sun", view: ItemInfo(.sun)),
                    .init(title: "Tshirt", view: ItemInfo(.tshirt)),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .controlBar:
            let bar = ControlBar(countdown: "5d 8h")
            bar.constrainHeight(272)
            bar.constrainWidth(56)
            let vc = StoryBookExampleViewController(
                title: "Control Bar",
                components: [
                    .init(title: "", view: bar, color: R.color.blueGrey()!),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break


            
        default: break
        }
    }
}

extension HomeViewController: PrimaryBtnDelegate {
    func didTapPrimaryBtn() {
        
    }
    
    func didTapPrimaryBtn(with tag: Int) {
        switch tag {
        case 0:
            let popup = DSPopupDialogManager().createPopup(
                type: .info,
                emoji: "🗑",
                title: "This is a god damn very long title to show my support to this beautiful long title.",
                body: "This is a paragraph to explain what is happening and it's happening a lot of nothing here.",
                okLbl: "That's OK to me",
                cancelLbl: "I don't like the idea",
                okHandler: {},
                cancelHandler: {})
            self.present(popup, animated: true, completion: nil)
            break
        default:
            break
        }
        
    }
}
