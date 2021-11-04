import SwiftUI
import RainbowFWK

struct ItemChatView: View {
	var body: some View {
		VStack(alignment: .leading) {
			SuperTopBar(category: "Components", title: "Item Chat")
			content
			Spacer()
		}
		.navigationBarHidden(true)
		.background(Color.white100.edgesIgnoringSafeArea(.all))
		.edgesIgnoringSafeArea(.bottom)
	}
	
	//Automatic Message (grey)
	@State var withEmoji: Bool = true
	@State var withSubtitle: Bool = true
	@State var activeGrey: Bool = true
	
	//Automatic Message (white)
	@State var activeWhite: Bool = true
	
	//Automatic Message (Active appointment message)
	@State var location: LocationType = .videoCall
	@State var user: UserType = .candidate
	@State var activeAppointmentMessage: Bool = true

	var content: some View {
		ScrollView {
			ComponentContainer(title: "Active appointment message", settings: {
				VStack {
					Picker("Location", selection: $location) {
						Text("Store").tag(LocationType.store)
						Text("Video Call").tag(LocationType.videoCall)
					}
					Picker("User", selection: $user) {
						Text("Candidate").tag(UserType.candidate)
						Text("Recruiter").tag(UserType.store)
					}
					Toggle(isOn: $activeAppointmentMessage, label: { Text("Active").typography(.bodyXS)
					})
				}
			}, content: {
				let data = ItemChatData(storeId: 0, address: "This is a postal address that can take X ligns if necessary", interviewAddress: nil, candidacyId: 0, candidateId: 0, jobName: "Front office")
				
				let appointment = AppointmentHandlerModel(id: "0", status: .cancelled, storeId: 0, candidateId: 0, candidacyId: 0, createdAt: Date(), updatedAt: Date(),
					schedule: ScheduleHandlerModel(id: "0", appointment: "", createdAt: Date(), date: Date(), duration: 30, location: location), selectedSchedule: nil, declineLabel: nil, declineContent: "")
				
				if activeAppointmentMessage {
					ItemChatActive(data: data, appointment: appointment, user: user)
						.fixedSize(horizontal: false, vertical: true)
				} else {
					ItemChatCanceled(data: data, appointment: appointment)
						.fixedSize(horizontal: false, vertical: true)
				}
			}
			)
			
			ComponentContainer(title: "Automatic message (grey)", settings: {
				VStack(alignment: .leading) {
					Toggle(isOn: $withEmoji, label: { Text("With emoji").typography(.bodyXS)
					})
					Toggle(isOn: $withSubtitle, label: { Text("With subtitle").typography(.bodyXS)
					})
					Toggle(isOn: $activeGrey, label: { Text("Active").typography(.bodyXS) })
				}
			}, content: {
				ItemChatAutomatic(
					emoji: withEmoji ? "🚨" : nil,
					title: "You missed your interview",
					subtitle: withSubtitle ? "And you didn’t give any notice. The manager may reject future applications." : nil,
					type: .none,
					state: activeGrey ? .active : .fullyInactive,
					delegate: nil
				)
			})
			
			ComponentContainer(title: "Automatic Message (white)", settings: {
				VStack(alignment: .leading) {
					Toggle(isOn: $activeWhite, label: {
						Text("Active").typography(.bodyXS)
					})
				}
			}, content: {
				ItemChatAccepted(
					emoji: "🎉",
					title: "Offer made!",
					subtitle: "We’re glad the interview went well!",
					state: activeWhite ? .active : .inactive,
					delegate: nil
				)
				.fixedSize(horizontal: false, vertical: true)
			})
		}
		.animation(.spring())
	}
}

struct ItemChatView_Previews: PreviewProvider {
    static var previews: some View {
        ItemChatView()
    }
}
