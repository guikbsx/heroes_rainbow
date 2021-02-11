import UIKit
import Lottie
import SwiftDate

class CalendarViewController: UIViewController {

    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true)
    private var titleLbl = StoryBookTitle(title: "Title")
    private var components: [StoryBookPackage]?
    var animation = AnimationView(name: "wave")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        let emptyCalendar = CalendarPicker(monthDataArray: [], currentMonthData: nil)
        
        let editCalendar = CalendarPicker(monthDataArray: [.init(id: "0", storeId: 0, location: .store, startDate: Date() + 4.days, endDate: Date() + 4.days + 3.hours, duration: 3)], currentMonthData: .init(id: "0", storeId: 0, location: .store, startDate: Date() + 4.days, endDate: Date() + 4.days + 3.hours, duration: 3))
        
        let fullCalendar = CalendarPicker(monthDataArray: [
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 1.days, endDate: Date() + 1.days + 3.hours, duration: 30),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 4.days, endDate: Date() + 4.days + 3.hours, duration: 3),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 6.days, endDate: Date() + 6.days + 3.hours, duration: 30),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 7.days, endDate: Date() + 7.days + 3.hours, duration: 3),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 13.days, endDate: Date() + 13.days + 3.hours, duration: 30),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 15.days, endDate: Date() + 15.days + 3.hours, duration: 3),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 17.days, endDate: Date() + 17.days + 3.hours, duration: 30),
            .init(id: "0", storeId: 0, location: .store, startDate: Date() + 35.days, endDate: Date() + 35.days + 3.hours, duration: 3),
            
        ], currentMonthData: nil)
        
        fullCalendar.constrainHeight(540)
        emptyCalendar.constrainHeight(540)
        editCalendar.constrainHeight(540)
        
        components = [
            .init(title: "Months", view: MonthsView()),
            .init(title: "Empty calendar", view: emptyCalendar),
            .init(title: "Edit calendar", view: editCalendar),
            .init(title: "Full calendar", view: fullCalendar),
        ]
        
        view.addSubview(animation)
        animation.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -40, left: 0, bottom: 0, right: 0))
        animation.play()
        animation.loopMode = .autoReverse
        
        view.addSubview(topBar)
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBar.delegate = self

        view.addSubview(titleLbl)
        titleLbl.anchor(top: topBar.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(scrollView)
        scrollView.anchor(top: titleLbl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        view.backgroundColor = R.color.lightGrey()
        scrollView.delegate = self
        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        components?.forEach { component in
            let storybook = StoryBookView(view: component.view, title: component.title, color: component.color)
            stackView.addArrangedSubview(storybook)
        }
    }
}

extension CalendarViewController: TopBarDelegate {
    func didTapLeftBtn() { self.navigationController?.popViewController(animated: true) }
    func didTapRightBtn() {}
}

extension CalendarViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { animation.pause() }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { animation.play() }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) { if !decelerate { animation.play() } }
}


