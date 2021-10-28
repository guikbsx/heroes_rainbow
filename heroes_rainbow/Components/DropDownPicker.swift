import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct DropdownPicker: View {
	internal init(title: String, selection: Binding<FontStyle>, options: [FontStyle]) {
		self.title = title
		self._selection = selection
		self.options = options
		
		RainbowFWK.load()
	}
	
	
	var title: String
	@Binding var selection: FontStyle
	var options: [FontStyle]
	
	@State private var showOptions: Bool = false
	
	let vGridLayout = [ GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) ]
	
	var body: some View {
		ZStack(alignment: .topLeading) {
			// Static row which shows user's current selection
			HStack {
				Text(title)
					.typography(.subtitleXS)
				Spacer()
				Text(selection.rawValue)
					.typography(.bodyXS)
					.foregroundColor(Color.black.opacity(0.6))
				Image(systemName: "chevron.right")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 10, height: 10)
			}
			.padding(.horizontal, 12)
			.padding(.vertical, 8)
			.background(Color.white
							.cornerRadius(8)
							.elevation(style: .hills)
			)
			.onTapGesture {
				// show the dropdown options
				withAnimation(Animation.spring().speed(2)) {
					showOptions = true
				}
			}
			
			// Drop down options
			if showOptions {
				VStack(alignment: .leading, spacing: 4) {
					Text(title)
						.typography(.subtitleXS)
						.foregroundColor(.black)
					LazyHGrid(rows: vGridLayout) {
						Spacer()
						ForEach(options.indices, id: \.self) { index in
							if options[index] == selection {
								Text(options[index].rawValue)
									.typography(.subtitleXS)
									.padding(.vertical, 8)
									.padding(.horizontal, 12)
									.background(Color.purple500)
									.foregroundColor(.white)
									.cornerRadius(4)
									.onTapGesture {
										withAnimation(Animation.spring().speed(2)) {
											showOptions = false
										}
									}
							} else {
								Text(options[index].rawValue)
									.typography(.bodyXS)
									.onTapGesture {
										// update user selection and close options dropdown
										withAnimation(Animation.spring().speed(2)) {
											selection = options[index]
											showOptions = false
										}
									}
							}
							Spacer()
						}
					}
					.frame(width: UIScreen.width - 40 - 24, height: 100)
					.padding(.vertical, 8)
					.transition(AnyTransition.move(edge: .top).combined(with: .opacity))
					
				}
				.padding(.horizontal, 12)
				.padding(.vertical, 8)
				.background(Color.white.cornerRadius(8).elevation(style: .hills, state: .focus))
				.foregroundColor(.black)
				.transition(.opacity)
				.frame(width: UIScreen.width - 40)
			}
			
		}
	}
}

@available(iOS 14.0, *)
struct DropdownPicker_Previews: PreviewProvider {
	static var previews: some View {
		DropdownPicker(title: "Font", selection: .constant(.header1), options: [.header1, .header2, .header3, .header4, .header5, .header6, .subtitle, .subtitleS, .subtitleXS, .body, .bodyXS, .caption])
	}
}
