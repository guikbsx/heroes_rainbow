import UIKit

class AppInfos {
	static let shortVersion: String = {
		var appVersion = ""
		if let info = Bundle.main.infoDictionary {
			appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
		}
		return appVersion
	}()
	
	static let buildNumber: String = {
		var buildNumber = ""
		if let info = Bundle.main.infoDictionary {
			buildNumber = info["CFBundleVersion"] as? String ?? ""
		}
		return buildNumber
	}()
	
	static let version: String = {
 "\(AppInfos.shortVersion)-\(AppInfos.buildNumber)"
	}()
	
	static let appId = "id1348350628"
}
