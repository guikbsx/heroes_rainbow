import Foundation

public struct DesignSystem {
    let type: DesignSystemType
    let label: String
}

enum DesignSystemType {
    /*settings*/
    case colors
    case fonts
    case lottie
    /*components*/
    case autocomplete
    case button
    case calendar
    case cellsRadioBtn
    case divider
    case input
    case itemAction
    case itemNaming
    case navBars
    case theVoice
    case time
    case modal
}

public final class DSViewModel {

    public typealias SectionDS = (name: String?, designSystems: [DesignSystem])
    public var sections:[SectionDS] = [SectionDS]()
    
    public init() {
        setupSections()
    }
    
    private func setupSections() {
        var components = (
            name: "Components",
            designSystems: [
                DesignSystem(type: .autocomplete, label: "Autocomplete"),
                DesignSystem(type: .button, label: "Buttons"),
                
                ///La vue de calendar dépasse du cadre + ajouter les autres states du calendar
                DesignSystem(type: .calendar, label: "Date Picker 🚧"),
                
                DesignSystem(type: .divider, label: "Divider"),
                DesignSystem(type: .itemAction, label: "Item Action"),
                DesignSystem(type: .itemNaming, label: "Item Naming 🚧"),
                DesignSystem(type: .navBars, label: "Top Bar ✨"),
                
                ///Faire en sorte qu'on puisse mettre plusieurs lignes...
                DesignSystem(type: .cellsRadioBtn, label: "Item Choice 🚧"),
                
                ///Il manque la barre au dessus des choix du picker, il faudrait l'intégrer dans le component
                DesignSystem(type: .input, label: "Input"),
                
                DesignSystem(type: .theVoice, label: "The Voice"),
                DesignSystem(type: .time, label: "Time Picker ✨"),
                DesignSystem(type: .modal, label: "Modal ✨")
        ])
        
        var settings = (
            name: "Settings",
            designSystems: [
                DesignSystem(type: .colors, label: "Colors"),
                DesignSystem(type: .fonts, label: "Fonts ❌"),
                DesignSystem(type: .lottie, label: "Animations ✨")
            ])
        sections.append(settings)

        ///Trie par ordre alphabétique
        settings.designSystems.sort {
            $0.label < $1.label
        }

        components.designSystems.sort {
            $0.label < $1.label
        }
        
        sections.append(components)
    }
    
    public func section(at index: Int) -> SectionDS {
        return sections[index]
    }

    public func designSystem(at indexPath: IndexPath) -> DesignSystem {
        return sections[indexPath.section].designSystems[indexPath.row]
    }
    
}
