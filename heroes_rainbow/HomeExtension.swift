//
//  HomeExtension.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 14/01/2021.
//

import UIKit
import Lottie

extension HomeViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            
        case .fonts:
            let vc = StoryBookExampleViewController(
                title: "Fonts",
                components: [
                ])
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
            let actionCell = ItemAction()
            actionCell.setup(name: "Add a hiring event", image: R.image.addButton()!)
            let infoCell = ItemAction()
            infoCell.setup(name: "Nov. 19", interval: "11:45AM - 13:45AM", image: R.image.storeIcon()!)

            let vc = StoryBookExampleViewController(
                title: "Item Action",
                components: [
                    .init(title: "Basic item", view: actionCell),
                    .init(title: "Basic item with info", view: infoCell)
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .itemNaming:
            let vc = StoryBookExampleViewController(
                title: "Item Naming",
                components: [
                    .init(title: "Candidate component", view: ItemNaming(user: .candidate, mainLbl: "Pierre Dupont", secondaryLbl: "Sales Associate"), color: R.color.blueGrey()!)
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .cellsRadioBtn:
            let shortChoice = ItemChoice()
            shortChoice.setup(label: "Input Name", selected: false)
            let vc = StoryBookExampleViewController(
                title: "Item Choice",
                components: [
                    .init(title: "Short text selected", view: shortChoice),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
 
        case .navBars:
//            let cell = ItemAction()
//            cell.setup(name: "This is a test", image: R.image.storeIcon())
            let vc = StoryBookExampleViewController(
                title: "Top Bar",
                components: [
                    .init(title: "Bar with close button", view: TopBar(backBtn: false, actionBtn: .close)),
                    .init(title: "Bar with back button", view: TopBar(backBtn: true)),
                    .init(title: "Bar with back and skip button", view: TopBar(backBtn: true, actionBtn: .skip)),
                    .init(title: "Bar with back and left custom button", view: TopBar(backBtn: true, actionBtn: .custom, customActionLbl: "Delete")),
                    .init(title: "Bar with left and right button and text between us", view: TopBar(backBtn: true, text: "This is an info",actionBtn: .skip)),
//                    .init(title: "Test", view: cell)
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
//            let vc = AutocompleteViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .calendar:
            let vc = StoryBookExampleViewController(
                title: "Date Picker",
                components: [
                    .init(title: "Days", view: MonthsView()),
//                    .init(title: "Landing Picker", view: MonthDatePicker(month: .thisMonth))
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .time:
            let vc = StoryBookExampleViewController(
                title: "Time Picker",
                components: [
//                    .init(title: "Picker with 15 minutes gap.", view: TimePicker(template: .startingHour, duration: 15)),
//                    .init(title: "Picker with 30 minutes gap.", view: TimePicker(template: .endingHour, duration: 30)),
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
        }
    }
}

extension HomeViewController: PrimaryBtnDelegate {
    func didTapPrimaryBtn() {
        
    }
    
    func didTapPrimaryBtn(with tag: Int) {
        switch tag {
        case 0:
//            let popup = DSPopupDialogManager()
//            popup.displayDesignSystemPopup(
//                controller: self,
//                type: .info,
//                emoji: "😀",
//                title: "This is a god damn very long title to show my support to this beautiful long title.",
//                body: "This is a paragraph to explain what is happening and it's happening a lot of nothing here.",
//                okLbl: "That's OK to me",
//                cancelLbl: "I don't like the idea",
//                okHandler: {},
//                cancelHandler: {})
            break
        default:
            break
        }

    }
}
