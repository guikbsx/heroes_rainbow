import Foundation

public struct DesignSystem {
    let type: DesignSystemType
    let label: String
}

enum DesignSystemType {
    /*settings*/
    case colors
    case fonts
    /*components*/
    case autocomplete
    case button
    case calendar
    case cellsRadioBtn
    case days
    case divider
    case input
    case itemAction
    case itemNaming
    case navBars
    case theVoice
    case time
}

public final class DSViewModel {

    public typealias SectionDS = (name: String?, designSystems: [DesignSystem])
    public var sections:[SectionDS] = [SectionDS]()
    
    public init() {
        setupSections()
    }
    
    private func setupSections() {
        var settings = (
            name: "Settings",
            designSystems: [
                DesignSystem(type: .colors, label: "Colors"),
                DesignSystem(type: .fonts, label: "Fonts"),
            ])
        settings.designSystems.sort {
            $0.label < $1.label
        }
        sections.append(settings)
        var components = (
            name: "Components",
            designSystems: [
                DesignSystem(type: .autocomplete, label: "Autocomplete"),
                DesignSystem(type: .button, label: "Buttons"),
                DesignSystem(type: .calendar, label: "Date Picker"),
                DesignSystem(type: .days, label: "Day Box"),
                DesignSystem(type: .divider, label: "Divider"),
                DesignSystem(type: .itemAction, label: "Item Action"),
                DesignSystem(type: .itemNaming, label: "Item Naming"),
                DesignSystem(type: .navBars, label: "Navigation Bars"),
                DesignSystem(type: .cellsRadioBtn, label: "Radio Button"),
                DesignSystem(type: .input, label: "Input"),
                DesignSystem(type: .theVoice, label: "The Voice"),
                DesignSystem(type: .time, label: "Time Picker")
        ])
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
