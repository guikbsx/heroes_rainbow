import SwiftUI
import RainbowFWK

@available(iOS 14.0, *)
struct TheVoiceView: View {
	
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "The Voice", isLoading: $isLoading)
			content
				.animation(.spring(), value: actualStep)
				.animation(.spring(), value: notified)

			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var actualStep: CGFloat = 1
	@State var notified: Bool = false
	
	var content: some View {
		ScrollView {
			ComponentContainer(title: "Original Voice", settings: {
				Stepper("Change voice step (\(Int(actualStep)))", value: $actualStep, in: 1...5).typography(.bodyXS)
			}, content: {
				NewVoice(title: .constant("\(isLoading ? "placeholder " : "This is a voice of a page")"), actualStep: $actualStep, numberOfStep: .constant(5))
					.redacted(reason: isLoading ? .placeholder : [])
			})
			
			ComponentContainer(title: "Centering page title", settings: {}, content: {
				PageTitle(textAlignment: .leading, onTap: {})
					.environmentObject(PageTitleModel(title: "Centered Title", buttonTitle: "", notifications: 0))
					.redacted(reason: isLoading ? .placeholder : [])
			})
			
			ComponentContainer(title: "Leading page title", settings: {
				Toggle(isOn: $notified, label: { Text("Activate multiple notifications").typography(.bodyXS)
				})
			}, content: {
				if notified {
					PageTitle(textAlignment: .leading, onTap: {})
						.environmentObject(PageTitleModel(title: "Left Title", buttonTitle: "Button", notifications: 10))
						.redacted(reason: isLoading ? .placeholder : [])
				} else {
					PageTitle(textAlignment: .leading, onTap: {})
						.environmentObject(PageTitleModel(title: "Left Title", buttonTitle: "Button", notifications: 0))
						.redacted(reason: isLoading ? .placeholder : [])
				}
			})
		}
	}
}

@available(iOS 14.0, *)
struct TheVoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TheVoiceView()
    }
}
