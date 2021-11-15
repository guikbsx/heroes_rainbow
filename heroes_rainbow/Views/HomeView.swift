import SwiftUI
import RainbowFWK
@available(iOS 14.0, *)
struct HomeView: View {
	
	var data: [HomeData] = [
		HomeData(
			name: "Foundations",
			categories: [
				CategoryData(destination: LayoutView()		, label: "Layout"),
				CategoryData(destination: ElevationsView()	, label: "Elevations & Shadow"),
			]
		),
		HomeData(
			name: "Brand",
			categories: [
				CategoryData(destination: ColorsView()		, label: "Colors"),
				CategoryData(destination: TypographyView()	, label: "Typography"),
			]
		),
		HomeData(
			name: "Components",
			categories: [
				CategoryData(destination: AutocompleteView(), label: "Autocomplete"),
				CategoryData(destination: Color.blue		, label: "Badge", disabled: true),
				CategoryData(destination: BannersView()		, label: "Banner"),
				CategoryData(destination: BottomBarView()	, label: "Bottom Bar 🚧"),
				CategoryData(destination: ButtonsView()		, label: "Button"),
				CategoryData(destination: CardView()		, label: "Card"),
				CategoryData(destination: Color.blue		, label: "Date Picker", disabled: true),
				CategoryData(destination: DividerView()		, label: "Divider"),
				CategoryData(destination: InputView()		, label: "Input 👨‍💻"),
				CategoryData(destination: ItemActionView()	, label: "Item Action"),
				CategoryData(destination: Color.blue		, label: "Item Info", disabled: true),
				CategoryData(destination: ItemChatView()	, label: "Item Chat"),
				CategoryData(destination: ItemChoiceView()	, label: "Item Choice"),
				CategoryData(destination: Color.blue		, label: "Item Comment", disabled: true),
				CategoryData(destination: Color.blue		, label: "Item Naming", disabled: true),
				CategoryData(destination: Color.blue		, label: "Item Notification", disabled: true),
				CategoryData(destination: Color.blue		, label: "Item Rate", disabled: true),
				CategoryData(destination: ItemVideoView()	, label: "Item Videos"),
				CategoryData(destination: LoaderView()		, label: "Loader"),
				CategoryData(destination: MessagesView()	, label: "Message"),
				CategoryData(destination: Color.blue		, label: "Menu Bar", disabled: true),
				CategoryData(destination: Color.blue		, label: "Profile Picker", disabled: true),
				CategoryData(destination: SubtitleView()	, label: "Subtitle"),
				CategoryData(destination: Color.blue		, label: "Tabs", disabled: true),
				CategoryData(destination: Color.blue		, label: "The Voice", disabled: true),
				CategoryData(destination: TopBarView()		, label: "Top Bar"),
				CategoryData(destination: Color.blue		, label: "Time Picker", disabled: true),
			]
		),
//		HomeData(
//			name: "Organism",
//			categories: [
//				CategoryData(destination: Color.blue		, label: "Header Profile", disabled: true),
//				CategoryData(destination: Color.blue		, label: "Bottom Sheet", disabled: true),
//				CategoryData(destination: Color.blue		, label: "Modal", disabled: true),
//				CategoryData(destination: Color.blue		, label: "Success Page", disabled: true),
//			]
//		),
	]
	
	@State var isShowingAllCategories: Bool = false
	
	var body: some View {
		NavigationView {
			VStack(
				alignment: .leading,
				spacing: 8,
				content: {
					Rectangle()
						.fill(Color.purple500)
						.edgesIgnoringSafeArea(.all)
						.frame(height: 0)
					VStack(
						alignment: .leading,
						spacing: 8,
						content: {
							Text("Rainbow's\nDesign System")
								.typography(.header3)
								.gradientForeground(gradient: Color.powerDS)
						}
					)
					.padding(20)
					scrollView
				}
			)
			.navigationBarHidden(true)
		}
	}
	
	var scrollView: some View {
		ScrollView {
			let vGridLayout = [ GridItem(.flexible()), GridItem(.flexible()) ]
			
			ScrollViewReader { reader in
				Toggle(isOn: $isShowingAllCategories, label: {
					Text("Show all categories").typography(.bodyXS)
				})
				.toggleStyle(SwitchToggleStyle(tint: .purple500))
				ForEach(data.indices, id: \.self) { homeIndex in
					let home = data[homeIndex]
					DividerSwiftUI(text: home.name).padding(.horizontal, -16)
					LazyVGrid(columns: vGridLayout) {
						ForEach(home.categories.indices, id: \.self) { categoryIndex in
							let category = home.categories[categoryIndex]
							if isShowingAllCategories {
								NavigationLink(
									destination: category.destination,
									label: {
										TextGrid(category.label, isNew: category.isNew)
									}
								)
								.frame(width: UIScreen.width / 2 - 28)
								.disabled(category.disabled)
								.opacity(category.disabled ? 0.25 : 1)
							} else {
								if !category.disabled {
									NavigationLink(
										destination: category.destination,
										label: {
											TextGrid(category.label, isNew: category.isNew)
										}
									)
									.frame(width: UIScreen.width / 2 - 28)
									.disabled(category.disabled)
									.opacity(category.disabled ? 0.25 : 1)
									
								}
							}
						}
					}
					.padding(.bottom)
					.onAppear {
						reader.scrollTo(0)
					}
				}
				Text("Dev with ♥️ by iOS Team")
					.padding(.bottom)
					.typography(.subtitleXS)
					.foregroundColor(.grey400)
			}.padding(.horizontal, 20)
		}
	}
}


@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}

struct HomeData {
	let name: String
	let categories: [CategoryData]
}

struct CategoryData {
	init<V>(destination : V, label: String, isNew: Bool = false, disabled: Bool = false) where V: View {
		self.destination = AnyView(destination)
		self.label = label
		self.isNew = isNew
		self.disabled = disabled
	}
	
	let destination: AnyView
	let label: String
	let isNew: Bool
	let disabled: Bool
}

