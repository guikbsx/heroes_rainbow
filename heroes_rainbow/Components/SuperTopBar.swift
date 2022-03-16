import SwiftUI
import RainbowFWK

struct SuperTopBar: View {
	@Environment(\.presentationMode) var presentationMode
	var category: String
	var title: String
	@Binding var isLoading: Bool
	
	var isLoadingEnabled: Bool = false
	
	init(category: String, title: String, isLoading: (Binding<Bool>)? = nil) {
		self.category = category
		self.title = title
		if isLoading != nil {
			self._isLoading = isLoading!
			self.isLoadingEnabled = true
		} else {
			self._isLoading = .constant(false)
		}
	}
	
    var body: some View {
		VStack(alignment: .leading) {
		Rectangle()
			.fill(Color.purple500)
			.edgesIgnoringSafeArea(.all)
			.frame(height: 0)
		TopBar(
			component: .constant(.init(left: .back, middle: .none, right: .none)),
			leftBtn: {
				self.presentationMode.wrappedValue.dismiss()
			},
			centerLbl: .constant("")
		)
		VStack(alignment: .leading, spacing: 16) {
			CategoryView(category)
			HStack {
				Text("\(title) ")
					.typography(.header4)
					.gradientForeground(gradient: Color.powerDS)
				if isLoadingEnabled {
					Button(
						action: {
							withAnimation(.spring()) { isLoading.toggle() }
						}, label: {
							Image(systemName: isLoading ? "xmark.circle" : "checkmark.circle.fill")
								.foregroundColor(.turquoise500)
								.padding(4)
								.padding(.top, 2)
						}
					)
				}
			}
		}
		.padding(.horizontal, 20)
		}
    }
}

struct SuperTopBar_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			SuperTopBar(category: "Foundations", title: "Typography", isLoading: .constant(true))
			SuperTopBar(category: "Components", title: "Card", isLoading: .constant(false))
			SuperTopBar(category: "Organisms", title: "Header Profile")
		}
			.previewLayout(.sizeThatFits)
    }
}
