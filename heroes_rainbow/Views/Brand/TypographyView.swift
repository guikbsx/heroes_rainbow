import SwiftUI
import RainbowFWK

struct TypographyView: View {
	init() { RainbowFWK.load() }
	
	var options: [FontStyle] = [.header1, .header2, .header3, .header4, .header5, .header6, .subtitle, .subtitleS, .subtitleXS, .body, .bodyXS, .caption]
	@State var selection: FontStyle = .header4
	
	var informationLbl: String {
		switch selection {
			case .header1: 		return "Font : Rift - Bold Italic\nSize : 75 px"
			case .header2: 		return "Font : Rift - Bold Italic\nSize : 50 px"
			case .header3: 		return "Font : Rift - Bold Italic\nSize : 40 px"
			case .header4: 		return "Font : Rift - Bold Italic\nSize : 28 px"
			case .header5: 		return "Font : Rift - Bold Italic\nSize : 22 px"
			case .header6: 		return "Font : Rift - Bold Italic\nSize : 20 px"
			case .subtitle: 	return "Font : Gilroy - Bold\nSize : 18 px"
			case .subtitleS: 	return "Font : Gilroy - Bold\nSize : 16 px"
			case .subtitleXS: 	return "Font : Gilroy - Bold\nSize : 14 px"
			case .body: 		return "Font : Gilroy - Medium\nSize : 16 px"
			case .bodyXS: 		return "Font : Gilroy - Medium\nSize : 14 px"
			case .caption: 		return "Font : Gilroy - Medium\nSize : 12 px"
		}
	}

	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Foundations", title: "Shadows & Elevations")
			if #available(iOS 14.0, *) {
				DropdownPicker(title: "Font", selection: $selection, options: options)
					.padding(.horizontal, 20)
			}
			content
				.padding(.vertical, 28)
			
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
		
	}
	
	var content: some View {
			VStack(alignment: .leading, spacing: 0) {
				Text(informationLbl)
					.fixedSize(horizontal: false, vertical: true)
					.typography(.bodyXS)
					.foregroundColor(.grey400)
					.padding(.bottom)
				HStack {
					Text("The quick brown fox jumps\nover the lazy dog.")
						.typography(selection)
						.multilineTextAlignment(.leading)
					Spacer()
				}
				
			}
			.padding(.horizontal, 20)
			.frame(width: UIScreen.width)
	}
}

struct TypographyView_Previews: PreviewProvider {
    static var previews: some View {
        TypographyView()
    }
}
