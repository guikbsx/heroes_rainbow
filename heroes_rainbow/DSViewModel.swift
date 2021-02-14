import Foundation

public struct DesignSystem {
    let type: DesignSystemType
    let label: String
}

enum DesignSystemType {
    /*settings*/
    case colors
    case lottie
    
    /*components*/
    case autocomplete
    case button
    case calendar
    case itemChoice
    case divider
    case input
    case itemAction
    case itemChat
    case itemVideo
    case topBar
    case menuBar
    case theVoice
    case time
    case modal
    
    /*modules*/
    case moduleVideo
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
                DesignSystem(type: .calendar, label: "Date Picker"),
                DesignSystem(type: .divider, label: "Divider"),
                DesignSystem(type: .itemAction, label: "Item Action"),
                DesignSystem(type: .topBar, label: "Top Bar"),
                DesignSystem(type: .itemChoice, label: "Item Choice"),
                DesignSystem(type: .input, label: "Input"),
                DesignSystem(type: .theVoice, label: "The Voice"),
                DesignSystem(type: .time, label: "Time Picker"),
                DesignSystem(type: .modal, label: "Modal"),
                DesignSystem(type: .itemVideo, label: "Item Video"),
                DesignSystem(type: .itemChat, label: "Item Chat 🛠"),
                DesignSystem(type: .menuBar, label: "Menu Bar"),
            ])
        
        var modules = (
            name: "Modules",
            designSystems: [
                DesignSystem(type: .moduleVideo, label: "Module Video ✨"),
            ])
        
        var settings = (
            name: "Settings",
            designSystems: [
                DesignSystem(type: .colors, label: "Colors"),
                DesignSystem(type: .lottie, label: "Animations"),
            ])
        
        sections.append(modules)
        sections.append(components)
        sections.append(settings)
        
        ///Trie par ordre alphabétique
        settings.designSystems.sort { $0.label < $1.label }
        components.designSystems.sort { $0.label < $1.label }
        modules.designSystems.sort { $0.label < $1.label }
        
    }
    
    public func section(at index: Int) -> SectionDS {
        return sections[index]
    }
    
    public func designSystem(at indexPath: IndexPath) -> DesignSystem {
        return sections[indexPath.section].designSystems[indexPath.row]
    }
    
}
