import SwiftUI
import RainbowFWK

struct HomeView: View {
		
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
							Group {
								DividerSwiftUI(text: "Foundations").padding(.horizontal, -16)
								LazyVGrid(columns: vGridLayout) {
									Group {
										NavigationLink(destination: LayoutView(),
													   label: { TextGrid("Layout")})
										NavigationLink(destination: ElevationsView(),
													   label: { TextGrid("Shadows & Elevations") })
									}
									.frame(width: UIScreen.width / 2 - 28)
								}.padding(.bottom)
							}
							
							Group {
								DividerSwiftUI(text: "Brand").padding(.horizontal, -16)
								LazyVGrid(columns: vGridLayout) {
									Group {
										NavigationLink(destination: ColorsView(),
													   label: { TextGrid("Colors") })
										NavigationLink(destination: TypographyView(),
													   label: { TextGrid("Typography") })
									}
									.frame(width: UIScreen.width / 2 - 28)
								}.padding(.bottom)
							}
							
							Group {
								DividerSwiftUI(text: "Components").padding(.horizontal, -16)
								LazyVGrid(columns: vGridLayout) {
									Group {
										NavigationLink(destination: Color.blue,
													   label: { TextGrid("Autocomplete") })
											.disabled(true).opacity(0.25)
										NavigationLink(destination: Color.blue,
													   label: { TextGrid("Banner") })
											.disabled(true).opacity(0.25)
										NavigationLink(destination: Color.blue,
													   label: { TextGrid("Bottom Bar") })
											.disabled(true).opacity(0.25)
										NavigationLink(destination: ButtonsView(),
													   label: { TextGrid("Button") })
									}
									.frame(width: UIScreen.width / 2 - 28)
								}.padding(.bottom)

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
