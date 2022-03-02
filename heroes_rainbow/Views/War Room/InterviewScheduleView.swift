import SwiftUI
import RainbowFWK
import Kingfisher
import SwiftDate

struct InterviewScheduleView: View {
	
	var job: String
	var avatar: String?
	var date: Date
	
	var dayLbl: String {
		let dateInGoodTimeZone = DateInRegion(date, region: Region.current)

		return dateInGoodTimeZone.toFormat("MMM dd")
	}
	
	var hourLbl: String {
		let dateInGoodTimeZone = DateInRegion(date, region: Region.current)
		
		return HoursHelper.isAMPM() ? dateInGoodTimeZone.toFormat("h:mm a").lowercased() : dateInGoodTimeZone.toFormat("HH:mm").lowercased()
	}
	
	var body: some View {
		VStack(spacing: 6) {
			Text(job)
				.typography(.caption)
				.foregroundColor(.purple500)
				.lineLimit(1)
			KFImage(URL(string: avatar ?? ""))
				.resizing(referenceSize: .init(width: 62, height: 62))
				.placeholder { Avatar(size: 62) }
				.aspectRatio(contentMode: .fit)
				.addBorder(Color.grey100, width: date.isToday ? 2 : 0, cornerRadius: 100)
			VStack(spacing: 0) {
				Text(dayLbl)
					.typography(.subtitleXS)
					.foregroundColor(.grey900)
				Text(hourLbl)
					.typography(.subtitleXS)
					.foregroundColor(.purple500)
			}
		}.frame(width: 93)
	}
}

struct InterviewScheduleView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			InterviewScheduleView(
				job: "Sales associates with a lot of caracater",
				avatar: "https://www.pngfind.com/pngs/m/693-6930601_poker-face-meme-png-use-this-card-when.png",
				date: Date()
			)
			InterviewScheduleView(
				job: "Sales associates",
				avatar: nil,
				date: Date() - 3.days
			)
		}
		.previewLayout(.sizeThatFits)
	}
}
