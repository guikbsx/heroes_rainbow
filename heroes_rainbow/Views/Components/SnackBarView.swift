import SwiftUI
import RainbowFWK

struct SnackBarView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Snack Bar")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var withAction: Bool = false
	
	
	var content: some View {
		VStack {
			ComponentContainer(title: "Subtitle", settings: {
				Toggle(isOn: $withAction) {
					Text("Action").typography(.bodyXS)
				}
			}, content: {
				SnackBar(label: "This is a label", button: "Action", action: withAction ? {} : nil)
			})
		}
	}
	
}

struct SnackBarView_Previews: PreviewProvider {
    static var previews: some View {
        SnackBarView()
    }
}
