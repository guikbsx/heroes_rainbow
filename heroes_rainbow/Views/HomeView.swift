import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct HomeView: View {
	
	@State var isPresented: Bool = false

	var data: [HomeData] = [
		HomeData(
			name: "Components",
			categories: [
				CategoryData(destination: AutocompleteView(), label: "Autocomplete"		, isNew: false		),
				CategoryData(destination: AvatarView()		, label: "Avatar"			, isNew: false		),
				CategoryData(destination: BadgeView()		, label: "Badge"			, isNew: false		),
				CategoryData(destination: BannersView()		, label: "Banner"			, isNew: false		),
				CategoryData(destination: BottomBarView()	, label: "Bottom Bar"		, isNew: false		),
				CategoryData(destination: ButtonsView()		, label: "Button"			, isNew: false		),
				CategoryData(destination: CardView()		, label: "Card"				, isNew: false		),
				CategoryData(destination: ChatListView()	, label: "Chat List"		, isNew: false		),
				CategoryData(destination: CommentView()		, label: "Comment"			, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Date Picker"		, isNew: false		),
				CategoryData(destination: DividerView()		, label: "Divider"			, isNew: false		),
				CategoryData(destination: InputView()		, label: "Input"			, isNew: false		),
				CategoryData(destination: ItemActionView()	, label: "Item Action"		, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Item Info"		, isNew: false		),
				CategoryData(destination: ItemChatView()	, label: "Item Chat"		, isNew: false		),
				CategoryData(destination: ItemNamingView()	, label: "Item Naming"		, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Item Rate"		, isNew: false		),
				CategoryData(destination: ItemVideoView()	, label: "Item Videos"		, isNew: false		),
				CategoryData(destination: LoaderView()		, label: "Loader"			, isNew: false		),
				CategoryData(destination: MessagesView()	, label: "Message"			, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Menu Bar"			, isNew: false		),
				CategoryData(destination: NotificationView(), label: "Notification"		, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Profile Picker"	, isNew: false		),
				CategoryData(destination: RadioView()		, label: "Radio"			, isNew: false		),
				CategoryData(destination: SnackBarView()	, label: "Snack Bar"		, isNew: false		),
				CategoryData(destination: SubtitleView()	, label: "Subtitle"			, isNew: false		),
				CategoryData(destination: TabsView()		, label: "Tabs"				, isNew: false		),
				CategoryData(destination: TheVoiceView()	, label: "The Voice"		, isNew: false		),
				CategoryData(destination: TopBarView()		, label: "Top Bar"			, isNew: false		),
//				CategoryData(destination: Color.blue		, label: "Time Picker"		, isNew: false		),
			]
		),
		HomeData(
			name: "Organism",
			categories: [
				CategoryData(destination: HeaderProfileView(), label: "Header Profile", isNew: false),
//				CategoryData(destination: Color.blue		, label: "Bottom Sheet", isNew: false),
//				CategoryData(destination: Color.blue		, label: "Modal", isNew: false),
				CategoryData(destination: SuccessPageView()	, label: "Success Page", isNew: false),
			]
		),
		HomeData(
			name: "Foundations",
			categories: [
				CategoryData(destination: EmojiView()		, label: "Emojis", isNew: false),
				CategoryData(destination: LayoutView()		, label: "Layout", isNew: false),
				CategoryData(destination: ElevationsView()	, label: "Elevations & Shadow", isNew: false),
			]
		),
		HomeData(
			name: "Brand",
			categories: [
				CategoryData(destination: ColorsView()		, label: "Colors", isNew: false),
				CategoryData(destination: TypographyView()	, label: "Typography", isNew: false),
			]
		)
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
		.toast(isPresented: $isActive, type: .toast, position: .bottom) {
			SnackBar(label: "Test")
		}
	}
	
	@State var isActive: Bool = false
	
	var scrollView: some View {
		ScrollView {
			let vGridLayout = [ GridItem(.flexible()), GridItem(.flexible())]

			HStack {
				Image(systemName: "sun.max.fill")
					.foregroundColor(.purple500)
				Text("Hope you like all our hard work !")
					.typography(.caption)
					.typography(.bodyXS)
					.foregroundColor(.grey500)
					.fixedSize(horizontal: false, vertical: true)
				Spacer()
			}
			.padding(12)
			.background(Color.grey100.cornerRadius(8))
			.padding(.horizontal, 20)


			ForEach(data.indices, id: \.self) { homeIndex in
				let home = data[homeIndex]
				HeroesDivider(text: home.name).padding(.horizontal, -16)
				LazyVGrid(columns: vGridLayout) {
					ForEach(home.categories.indices, id: \.self) { categoryIndex in
						let category = home.categories[categoryIndex]
						if !category.disabled {
							NavigationLink(
								destination: category.destination,
								label: {
									TextGrid(category.label, isNew: category.isNew)
								}
							)
							.disabled(category.disabled)
							.opacity(category.disabled ? 0.25 : 1)
							.buttonStyle(PlainButtonStyle())
							
						}
					}
				}
			}
			.padding(.horizontal, 20)
			Text("Dev with ♥️ by iOS Team")
				.padding(.bottom)
				.typography(.subtitleXS)
				.foregroundColor(.grey400)
		}
	}
	
}


@available(iOS 14.0, *)
class HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}

	#if DEBUG
	@objc class func injected() {
		UIApplication.shared.windows.first?.rootViewController =
				UIHostingController(rootView: HomeView())
	}
	#endif
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

