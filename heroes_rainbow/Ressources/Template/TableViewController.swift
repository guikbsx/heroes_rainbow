//
//  StoryBookExampleViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit
import SwiftUI
import Lottie

class TableViewController: UIViewController {

    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true)
    private var titleLbl = StoryBookTitle(title: "Item Chat")
    private var components: [StoryBookPackage]?
    var animation = AnimationView(name: "wave")

	lazy private var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		tableView.layoutIfNeeded()
		tableView.tableFooterView = UIView()
		tableView.layoutMargins = .zero
		tableView.contentInset = .zero
		tableView.backgroundColor = .clear
		var frame = CGRect.zero
		frame.size.height = .leastNormalMagnitude
		tableView.tableHeaderView = UIView(frame: frame)
		
		tableView.register(ItemChatMessageTableViewCell.self, forCellReuseIdentifier: "ItemChatMessageTableViewCell")
		tableView.register(ItemChatAutomaticTableViewCell.self, forCellReuseIdentifier: "ItemChatAutomaticTableViewCell")

		return tableView
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(animation)
        animation.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -40, left: 0, bottom: 0, right: 0))
        animation.play()
        animation.loopMode = .autoReverse
        
        view.addSubview(topBar)
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBar.delegate = self

        view.addSubview(titleLbl)
        titleLbl.anchor(top: topBar.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(tableView)
		tableView.anchor(top: titleLbl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        view.backgroundColor = R.color.lightGrey()
		
	}
	
}

extension TableViewController: TopBarDelegate {
    func didTapLeftBtn() { self.navigationController?.popViewController(animated: true) }
    func didTapRightBtn() {}
}

extension TableViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { animation.pause() }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { animation.play() }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) { if !decelerate { animation.play() } }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatMessageTableViewCell") as! ItemChatMessageTableViewCell
			cell.setup(type: .recipiant, text: "This is a message of the recipient", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
			return cell
		} else if indexPath.row == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatMessageTableViewCell") as! ItemChatMessageTableViewCell
			cell.setup(type: .recipiant, text: "This is a message with CTAs. It should take 80% of the max size of a screen. CTAs respect 16px of spacing.", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png", CTA: true)
			return cell
		} else if indexPath.row == 2 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatMessageTableViewCell") as! ItemChatMessageTableViewCell
			cell.setup(type: .writter, text: "This is a message of the writer", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
			return cell
		} else if indexPath.row == 3 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "", label: "This is an automatic message")
			return cell
		} else if indexPath.row == 4 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "😞", label: "We let them know you had to cancel.")
			return cell
		} else if indexPath.row == 5 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "😞", label: "We’re really sorry, the hiring manager had to cancel the interview.")
			return cell
		} else if indexPath.row == 6 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "😞", label: "We’re really sorry, the applicant had to cancel the interview.")
			return cell
		} else if indexPath.row == 7 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "😞", label: "We’re really sorry, your application has been rejected by the company.")
			return cell
		} else if indexPath.row == 8 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "😞", label: "This applicant can’t make it to your hiring event.", CTA: true)
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatAutomaticTableViewCell") as! ItemChatAutomaticTableViewCell
			cell.setup(emoji: "🔔", label: "We’ll let you know if new interview times become available.")
			return cell
		}
	}
}

struct TableVCPreview: PreviewProvider {
	
	static var previews: some View {
		TableVCContainerView()
			.edgesIgnoringSafeArea(.all)
	}
	
	struct TableVCContainerView: UIViewControllerRepresentable {
		func makeUIViewController(context: UIViewControllerRepresentableContext<TableVCPreview.TableVCContainerView>) -> UIViewController {
			return TableViewController()
		}
		
		func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TableVCPreview.TableVCContainerView>) {
			
		}
		
		typealias UIViewControllerType = UIViewController
	}
}


