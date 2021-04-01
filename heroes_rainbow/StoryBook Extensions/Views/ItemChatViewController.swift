//
//  StoryBookExampleViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit
import SwiftUI
import Lottie

class ItemChatViewController: UIViewController {

    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = ItemChatBar(icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png", user: "Pantéa Négui", job: "Barmade", actionBtnLbl: "view profile")

	lazy private var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
		tableView.contentInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.separatorStyle = .none
		tableView.keyboardDismissMode = .onDrag
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 300
		tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
		tableView.backgroundColor = .white
		
		tableView.register(ItemChatMessageTableViewCell.self, forCellReuseIdentifier: "ItemChatMessageTableViewCell")
		tableView.register(ItemChatAutomaticTableViewCell.self, forCellReuseIdentifier: "ItemChatAutomaticTableViewCell")
		tableView.register(ItemChatAcceptedTableViewCell.self, forCellReuseIdentifier: "ItemChatAcceptedTableViewCell")
		tableView.register(ItemChatActiveTableViewCell.self, forCellReuseIdentifier: "ItemChatDetailsTableViewCell")
		tableView.register(ItemChatCanceledTableViewCell.self, forCellReuseIdentifier: "ItemChatCanceledTableViewCell")
		
		return tableView
	}()
	
	private var textView = ItemChatTextView()
	private var keyboardConstraints: AnchoredConstraints!

	let delegate = ItemChatMessageDelegate()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil)
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableView.reloadData()
	}
    
    private func configure() {
		view.backgroundColor = .white
		
        view.addSubview(topBar)
		view.addSubview(tableView)
		view.addSubview(textView)
		
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
		tableView.anchor(top: topBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
		keyboardConstraints = textView.anchor(top: tableView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
		
		topBar.delegate = self
		
		delegate.didTapSecondBtn = { print("did tap good !") }
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
			self.keyboardConstraints.bottom?.constant = -keyboardHeight
			UIView.animate(withDuration: 0.2, animations: {
				self.view.layoutIfNeeded()
			})
		}
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		self.keyboardConstraints.bottom?.constant = 0
		UIView.animate(withDuration: 0.2, animations: {
			self.view.layoutIfNeeded()
		})
	}
	
}

extension ItemChatViewController: ItemChatBarDelegate {
    func didTapLeftBtn() { self.navigationController?.popViewController(animated: true) }
    func didTapRightBtn() {}
}

extension ItemChatViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCell(withIdentifier: "ItemChatMessageTableViewCell") as! ItemChatMessageTableViewCell
//		cell.setup(type: .recipiant, text: "This is a message of the recipient", icon: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png")
		let swiftUIView = ItemChatMessageLeft(message: "Test", image: "https://hellobiz.fr/wp-content/uploads/2018/02/Heroes.png", action: true, delegate: delegate).toUIView()
		let cell = UITableViewCell()
		cell.contentView.addSubview(swiftUIView)
		cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
		swiftUIView.fillSuperview()
		return cell
	}
}

struct TableVCPreview: PreviewProvider {
	
	static var previews: some View {
		Group {
			TableVCContainerView()
				.edgesIgnoringSafeArea(.all)
				.previewDevice("iPhone 12")
		}
	}
	
	struct TableVCContainerView: UIViewControllerRepresentable {
		func makeUIViewController(context: UIViewControllerRepresentableContext<TableVCPreview.TableVCContainerView>) -> UIViewController {
			return ItemChatViewController()
		}
		
		func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TableVCPreview.TableVCContainerView>) {
			
		}
		
		typealias UIViewControllerType = UIViewController
	}
}


