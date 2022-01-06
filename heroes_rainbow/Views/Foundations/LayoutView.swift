import RainbowFWK
import SwiftUI

struct LayoutView: View {
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Foundations", title: "Grid")
			ScrollView {
				gridView
					.padding(.top)
				
				Spacer().frame(height: 64)
				VStack(alignment: .leading, spacing: 16) {
					HStack {
						Text("Spacing")
							.typography(.subtitle)
							.gradientForeground(gradient: Color.powerDS)
						Spacer()
					}
				}
				.padding(.horizontal, 20)
				spacingView
					.padding(.top)
			}
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))		
	}
	
	var gridView: some View {
		HStack(alignment: .top, spacing: 0) {
			Rectangle()
				.fill(Color.red500.opacity(0.25))
				.frame(width: 20)
			VStack(alignment: .leading, spacing: 8) {
				Text("Rules :")
					.typography(.subtitleXS)
				Text("Rainbow uses a 8px grid system with 20px of space for the sides of the screens (small devices only).")
					.fixedSize(horizontal: false, vertical: true)
					.typography(.bodyXS)
					.foregroundColor(.grey400)
			}
			.padding(.vertical, 8)
			Rectangle()
				.fill(Color.red500.opacity(0.25))
				.frame(width: 20)
		}
		.frame(width: UIScreen.width)
	}
	
	var spacingView: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Rules :")
				.typography(.subtitleXS)
			Text("Rainbow uses a 8px grid system with 20px of space for the sides of the screens (small devices only).")
				.fixedSize(horizontal: false, vertical: true)
				.typography(.bodyXS)
				.foregroundColor(.grey400)
				.padding(.bottom)
			
			Text("Usage :")
				.typography(.subtitleXS)
			Text("4px : Small elements\n8px : Default padding.\n16px : Default margin between components\n24px : Default margin between categories.")
				.fixedSize(horizontal: false, vertical: true)
				.typography(.bodyXS)
				.foregroundColor(.grey400)
				.padding(.bottom)
		}
		.padding(.horizontal, 20)
	}
}

struct LayoutView_Previews: PreviewProvider {
	static var previews: some View {
		LayoutView()
	}
}
