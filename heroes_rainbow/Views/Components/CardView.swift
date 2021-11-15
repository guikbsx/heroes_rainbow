import SwiftUI
import RainbowFWK

struct CardView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Card")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@State var type: CardExperienceType = .company
	@State var withAvatar: Bool = true
	@State var now: Bool = true
	
	var content: some View {
		ScrollView {
			VStack {
				ComponentContainer(
					title: "Card Experience",
					settings: {
						VStack {
							Picker("Type", selection: $type) {
								Text("Company").tag(CardExperienceType.company)
								Text("School").tag(CardExperienceType.school)
								Text("Activity").tag(CardExperienceType.activity)
							}
							Toggle(isOn: $withAvatar, label: {
								Text("Avatar").typography(.bodyXS)
							})
							Toggle(isOn: $now, label: {
								Text("Now").typography(.bodyXS)
							})
						}
					},
					content: {
						CardExperience(
							type: type,
							avatar: withAvatar ? "https://taylordonato.com/wp-content/uploads/2020/10/Starbucks-Logo-1987.png" : nil,
							title: "MacDonald's",
							subtitle: "Front of house",
							caption: "San Francisco",
							date: "3 months",
							now: now
						)
						.animation(.spring())
					}
				)
				ComponentContainer(title: "Item Card", settings: {},
								   content: {
									ItemCard(model: ItemCardModel(id: 0, storeJob: storeJob, store: store), onVideoTap: {}, onDescriptionTap: {}, onBookmarkTap: {_ in })
								   })
			}
		}
	}
	
	let store = Store(
		id: 0,
		name: "Starbucks of incredible company",
		address: "65-66 Beacon St, Boston, MA 02108, United States",
		pin: "What is it ?",
		url: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png",
		distance: 3.4,
		city: "Boston",
		company:
			Company(id: 1, name: "Starbucks", logo: "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/1200px-Starbucks_Coffee_Logo.svg.png"),
		storeJobs: [
			StoreJob(id: 1, jobs: ["Back of house", "Front of house"], salary: "14", desc: "What is it ?", hasApplied: false, benefits: [Benefit(name: "Training", emoji: "🏋️‍♂️"), Benefit(name: "Tips", emoji: "💸")], isBookmarked: false, nbPositionLeft: 3)
		],
		stories: [
			StoreStory(video: "https://assets.heroes.jobs/medias/2516/pandaExpress_2.1.mp4", preview: "https://assets.heroes.jobs/medias/2516/conversions/pandaExpress_2.1-preview.jpg"),
			StoreStory(video: "https://assets.heroes.jobs/medias/2657/php128Ygv.mp4", preview: "https://assets.heroes.jobs/medias/2657/conversions/php128Ygv-preview.jpg"),
			StoreStory(video: "https://assets.heroes.jobs/medias/2516/pandaExpress_2.1.mp4", preview: "https://assets.heroes.jobs/medias/2679/conversions/instacart_03.1-preview.jpg"),
		],
		isActive: true,
		isNational: false,
		nbViews: 140,
		nbAnswers: 1,
		answerTime: 1,
		averageTime: 1
	)
	
	let storeJob = StoreJob(id: 1, jobs: ["Back of house", "Front of house"], salary: "14", desc: "What is it ?", hasApplied: false, benefits: [Benefit(name: "Training", emoji: "🏋️‍♂️"), Benefit(name: "Tips", emoji: "💸")], isBookmarked: false, nbPositionLeft: 3)
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
