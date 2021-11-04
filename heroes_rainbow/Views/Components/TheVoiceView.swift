import SwiftUI
import RainbowFWK

struct TheVoiceView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "The Voice")
			content
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
				NewVoice(title: .constant("This is a voice of a page"), actualStep: $actualStep, numberOfStep: .constant(5))
			})
			
			ComponentContainer(title: "Centering page title", settings: {}, content: {
				PageTitle(textAlignment: .leading, onTap: {})
					.environmentObject(PageTitleModel(title: "Centered Title", buttonTitle: "", notifications: 0))
			})
			
			ComponentContainer(title: "Leading page title", settings: {
				Toggle(isOn: $notified, label: { Text("Activate multiple notifications").typography(.bodyXS)
				})
			}, content: {
				if notified {
					PageTitle(textAlignment: .leading, onTap: {})
						.environmentObject(PageTitleModel(title: "Left Title", buttonTitle: "Button", notifications: 10))
				} else {
					PageTitle(textAlignment: .leading, onTap: {})
						.environmentObject(PageTitleModel(title: "Left Title", buttonTitle: "Button", notifications: 0))
				}
			})
		}
		.animation(.spring())
	}
}

struct TheVoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TheVoiceView()
    }
}
