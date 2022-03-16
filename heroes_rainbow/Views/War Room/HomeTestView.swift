//import SwiftUI
//import RainbowFWK
//
//public struct SnackBar: View {
//	
//	var label: String
//	var button: String?
//	var action: (() -> Void)?
//	
//	public init(
//		label: String,
//		button: String? = nil,
//		action: (() -> Void)? = nil
//	) {
//		self.label = label
//		self.button = button
//		self.action = action
//	}
//	
//	public var body: some View {
//		content
//	}
//	
//	public var content: some View {
//		HStack {
//			Text(label)
//				.foregroundColor(.grey500)
//			Spacer()
//			if let _ = action {
//				Button(action: { action?() }) {
//					Text(button ?? "")
//						.foregroundColor(.purple500)
//				}
//			}
//		}
//		.typography(.subtitleXS)
//		.lineLimit(1)
//		.padding(.horizontal, 16)
//		.padding(.vertical, 8)
//		.background(
//			Color.purple100
//				.cornerRadius(8)
//		)
//		.elevation(style: .hills, state: .focus)
//	}
//}
//
//struct SnackBar_Previews: PreviewProvider {
//	static var previews: some View {
//		Group {
//			SnackBar(
//				label: "This is a text with a action",
//				button: "Action",
//				action: {
//					
//				}
//			)
//			SnackBar(
//				label: "This is a text without a action"
//			)
//		}
//			.previewLayout(.sizeThatFits)
//	}
//}
