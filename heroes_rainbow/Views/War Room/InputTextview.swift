//import SwiftUI
//import RainbowFWK
//
//public struct InputBirthdaySwiftUI: View {
//	
//	//	@State var date: Date? = nil
//	@Binding var isValidBirthday: Bool
//	@Binding var elevationState: ElevationState
//	
//	@Binding var newDate: Date?
//	@State var text: String
//	
//	var accentColor: Color {
//		switch elevationState {
//			case .default: return .clear
//			case .error: return .red500
//			case .focus: return .purple500
//		}
//	}
//	
//	public init(date: String?, isValidBirthday: Binding<Bool>, elevationState: Binding<ElevationState>, newDate: Binding<Date?>) {
//		self._elevationState = elevationState
//		self._isValidBirthday = isValidBirthday
//		self._newDate = newDate
//		if let date = date, date.count == 10  {
//			// standardformat : "yyyy-MM-dd"
//			let standardDateFormater = DateFormatter()
//			standardDateFormater.dateFormat = "yyyy-MM-dd"
//			// newFormat : "MMddyyyy
//			let textDateFormater = DateFormatter()
//			textDateFormater.dateFormat = "MMddyyyy"
//			
//			let standardDate = standardDateFormater.date(from: date)
//			let textDate = textDateFormater.string(for: standardDate) ?? ""
//			self._text = .init(initialValue: textDate)
//		} else {
//			self._text = .init(initialValue: "")
//		}
//	}
//	
//	public var body: some View {
//		content
//			.onReceive(text.publisher.last()) { output in
//				if self.text.count>8{ //set count as you want
//					self.text = String(self.text.dropLast())
//				}
//			}
//			.valueChanged(value: text, onChange: { value in
//				if text.count < 8 { isValidBirthday = false }
//				
//				let dateFormatter = DateFormatter()
//				dateFormatter.dateFormat = "MMddyyyy"
//				let hasfillMonth = text.count == 2
//				let hasFillDay = text.count == 4
//				let hasFillYear = text.count == 8
//				
//				if hasFillYear {
//					if let newDate = dateFormatter.date(from: text) {
//						let after1900 = dateFormatter.date(from: "01011990")
//						if newDate.isInRange(date: after1900!, and: Date()) {
//							withAnimation(.spring()) { elevationState = .focus }
//							self.newDate = newDate
//							self.isValidBirthday = true
//						} else {
//							withAnimation(.spring()) { elevationState = .error }
//							self.isValidBirthday = false
//						}
//					}
//				} else if hasFillDay {
//					if let _ = dateFormatter.date(from: "\(text)2016") {
//						withAnimation(.spring()) { elevationState = .focus }
//					} else {
//						withAnimation(.spring()) { elevationState = .error }
//					}
//				} else if hasfillMonth {
//					if let _ = dateFormatter.date(from:"\(text)152016") {
//						withAnimation(.spring()) { elevationState = .focus }
//					} else {
//						withAnimation(.spring()) { elevationState = .error }
//					}
//				}
//			})
//			.onAppear {
//				
//			}
//	}
//	
//	var content: some View {
//		ZStack {
//			VStack(alignment: .leading, spacing: 8) {
//				HStack(spacing: 4) {
//					HStack(spacing: 2) {
//						NumberBirthdayView(index: 0, text: text, placeholder: "M", accentColor: accentColor, isFirst: true)
//						NumberBirthdayView(index: 1, text: text, placeholder: "M", accentColor: accentColor)
//					}
//					Text("/").typography(.bodyXS).foregroundColor(.grey300)
//					HStack(spacing: 2) {
//						NumberBirthdayView(index: 2, text: text, placeholder: "D", accentColor: accentColor)
//						NumberBirthdayView(index: 3, text: text, placeholder: "D", accentColor: accentColor)
//					}
//					Text("/").typography(.bodyXS).foregroundColor(.grey300)
//					HStack(spacing: 2) {
//						NumberBirthdayView(index: 4, text: text, placeholder: "Y", accentColor: accentColor)
//						NumberBirthdayView(index: 5, text: text, placeholder: "Y", accentColor: accentColor)
//						NumberBirthdayView(index: 6, text: text, placeholder: "Y", accentColor: accentColor)
//						NumberBirthdayView(index: 7, text: text, placeholder: "Y", accentColor: accentColor)
//					}
//					Spacer()
//				}
//				.padding(.horizontal, 24)
//				.padding(.vertical, 16)
//				.background(
//					Color.white
//						.cornerRadius(36)
//						.addBorder(accentColor, cornerRadius: 36)
//						.elevation(style: .hills, state: elevationState)
//				)
//				if elevationState == .error {
//					Text("Please enter a valid date.")
//						.foregroundColor(.red500)
//						.typography(.caption)
//						.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top).combined(with: .opacity)))
//				}
//			}
//			.padding(.horizontal, 20)
//			.padding(.vertical, 8)
//			
//			TextField("Birthday", text: $text, onEditingChanged: { value in
//				elevationState = value ? .focus : .default
//			}, onCommit: {
//				
//			})
//			.opacity(0.1)
//			.foregroundColor(.clear)
//			.colorMultiply(.clear)
//			.keyboardType(.decimalPad)
//			.padding(.horizontal, 40)
//		}
//		
//		
//	}
//}
//
//struct NumberBirthdayView: View {
//	var index: Int
//	var text: String
//	var placeholder: String
//	var accentColor: Color
//	var isFirst: Bool = false
//	
//	let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
//	
//	@State var isActive: Bool = false
//	
//	var isLastNumber: Bool {
//		text.count == index + 1
//	}
//	
//	var isEmpty: Bool {
//		index == 0 && text[index].isEmpty
//	}
//	
//	var info: String {
//		if text[index] != "" {
//			return text[index]
//		} else {
//			return placeholder
//		}
//	}
//	
//	var body: some View {
//		ZStack(alignment: .bottom) {
//			HStack(spacing: -5) {
//				Rectangle()
//					.fill(isEmpty ? accentColor : .clear)
//					.frame(width: 2, height: 17)
//				Text(info)
//					.frame(width: 20)
//					.typography(info != placeholder ? .subtitleXS : .bodyXS)
//					.foregroundColor(info != placeholder ? .grey900 : .grey300)
//				Rectangle()
//					.fill(isLastNumber ? (isActive ? accentColor : .clear) : .clear)
//					.frame(width: 2, height: 17)
//			}
//			Rectangle()
//				.fill(Color.grey300)
//				.frame(width: 10, height: 1)
//				.offset(x: 0, y: -3)
//		}
//		.onReceive(timer, perform: { _ in
//			withAnimation(.spring()) { isActive.toggle() }
//		})
//		
//	}
//}
