import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct InputTextview: View {
	@State var text: String = "hello"
	@State var placeholder: String = "Message"
	
    var body: some View {
		HStack(alignment: .bottom) {
			textView
				.overlay(
					ZStack(alignment: .leading) {
						placeholderView
	//						.opacity(text.isEmpty ? 0 : 1)
						textEditor
					}
					.frame(width: UIScreen.width - 40 - 40 - 16)
					.background(Color.grey100.cornerRadius(12))
				)
			Button(action: {
				if text.isEmpty { return }
				
//				send(text)
				text = ""
				hideKeyboard()
			}, label: {
				Color.red500
//					.resizable()
					.frame(width: 16, height: 16)
					.padding(.horizontal, 20)
					.padding(.vertical, 12)
//					.background(isActive ? Color.black : Color.grey200)
					.cornerRadius(36)
			})
//			.disabled(!isActive)
		}
    }
	
	public var textView: some View {
		Text(text)
			.typography(.body)
			.foregroundColor(.grey500)
			.padding(.vertical, 8)
			.padding(.horizontal, 4)
			.lineLimit(5)
			.colorMultiply(.grey100)
			.opacity(0)
			.padding(8)
	}
	
	public var textEditor: some View {
			TextEditor(text: $text)
				.typography(.body)
				.colorMultiply(.grey100)
				.frame(maxWidth: .infinity, minHeight: 40)
				.padding(8)
				.padding(2)
				.opacity(!text.isEmpty ? 1 : 0.25)
	}
	
	public var placeholderView: some View {
		Text(placeholder)
			.typography(.body)
			.padding(.vertical, 8)
			.padding(.horizontal, 4)
			.lineLimit(5)
			.colorMultiply(.grey100)
	}
	
}

@available(iOS 14.0, *)
struct InputTextview_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			InputTextview()
			InputTextview().textEditor
		}
		.previewLayout(.sizeThatFits)
    }
}
