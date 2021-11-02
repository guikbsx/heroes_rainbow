import SwiftUI
import RainbowFWK

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
				CategoryData(destination: LayoutView()		, label: "Layout"),
				CategoryData(destination: ElevationsView()	, label: "Shadows & Elevations"),
			]
		),
		HomeData(
			name: "Components",
			categories: [
				CategoryData(destination: Color.blue		, label: "Autocomplete", disabled: true),
				CategoryData(destination: Color.blue		, label: "Banner", disabled: true),
				CategoryData(destination: Color.blue		, label: "Bottom Bar", disabled: true),
				CategoryData(destination: ButtonsView()		, label: "Button 👨‍💻"),
				CategoryData(destination: CardView()		, label: "Card"),
				CategoryData(destination: Color.blue		, label: "Date Picker", disabled: true),
				CategoryData(destination: DividerView()		, label: "Divider"),
				CategoryData(destination: InputView()		, label: "Input 👨‍💻"),
				CategoryData(destination: ItemActionView()	, label: "Item Action"),
			]
		),
	]
		
	var body: some View {
		if #available(iOS 14.0, *) {
			let vGridLayout = [ GridItem(.flexible()), GridItem(.flexible()) ]
			
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
						
						ScrollView {
							ForEach(data.indices, id: \.self) { homeIndex in
								let home = data[homeIndex]
								DividerSwiftUI(text: home.name).padding(.horizontal, -16)
									LazyVGrid(columns: vGridLayout) {
										ForEach(home.categories.indices, id: \.self) { categoryIndex in
											let category = home.categories[categoryIndex]
											NavigationLink(
												destination: category.destination,
												label: {
													TextGrid(category.label)
												}
											)
											.frame(width: UIScreen.width / 2 - 28)
											.disabled(category.disabled)
											.opacity(category.disabled ? 0.25 : 1)
										}
									}
									.padding(.bottom)
							}
						}.padding(.horizontal, 20)

					}
				)
				.navigationBarHidden(true)
			}
		} else {
			Text("you need an iPhone with iOS 14 to use this app.")
				.typography(.subtitle)
		}
	}
}

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
	init<V>(destination : V, label: String, disabled: Bool = false) where V: View {
		self.destination = AnyView(destination)
		self.label = label
		self.disabled = disabled
	}
	
	let destination: AnyView
	let label: String
	let disabled: Bool
}

