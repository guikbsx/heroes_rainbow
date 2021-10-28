import SwiftUI
import RainbowFWK

struct ButtonsView: View {
//	@Environment(\.presentationMode) var presentationMode
	
	init() { RainbowFWK.load() }
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Button")
			content
				.padding(.vertical)
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		
	}
	
	@State var primaryState: PrimaryBtnState = .enabled
	@State var withSubtitle: Bool = true
	
	var content: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 24) {
				VStack(alignment: .leading) {
					Text("Primary Button")
						.typography(.subtitleXS)
						.padding(.horizontal, 20)
					VStack {
						Picker("State", selection: $primaryState) {
							Text("Enabled").tag(PrimaryBtnState.enabled)
							Text("Disabled").tag(PrimaryBtnState.disabled)
						}
						.pickerStyle(SegmentedPickerStyle())
						if #available(iOS 14.0, *) {
							Toggle(isOn: $withSubtitle, label: {
								Text("Subtitle").typography(.bodyXS)
							})
							.toggleStyle(SwitchToggleStyle(tint: .purple500))
							.onAppear {
								UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.purple500)
								UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
							}
						} else {
							// Fallback on earlier versions
						}
					}
					.padding(12)
					.background(Color.grey100.cornerRadius(8))
					.padding(.horizontal, 20)
					
					PrimaryBtnSwiftUI(title: "Next", subtitle: withSubtitle ? "This is a optional subtitle" : nil, state: $primaryState, onTap: {})
						.background(Color.white)
				}
			}
		}
		.frame(width: UIScreen.width)
	}
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
