import SwiftUI
import FamilyControls

// Homework demo app
// 1. Shield discouraged apps
// 2. Remove shields for meeting goal
// 3. Customize the shields

// 1a. In order to setup my Xcode project to include Family Controls capability, I'll go to the Project Editor, select the app target, and under Signing & Capabilities click the plus button. I'll for Family Controls to find the capability and add it to my project.

@main
struct Homework2App: App {
    // 1b. Add an AppDelgate to the app to request authorization when the app first launches
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyModel.shared)
        }
    }
}

// 1b. The first thing Homework needs to do is request authorization for Family Controls
class AppDelegate: NSObject, UIApplicationDelegate {
    // Make this request when the app launches
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Calling this function will require a guardian in the family to approve Family Controls for Homework
        // This will prompt with an alert the first time the app launches
        // If a guardian has already approved Family Controls, it will silently return success
        // To prevent misuse, requestAuthorization will return failure if the signed-in iCloud is not a child using Family Sharing
        AuthorizationCenter.shared.requestAuthorization { result in
            // The request can either result in success or failure
            switch result {
            case .success():
                break
            case .failure(let error):
                print("Error for Family Controls: \(error)")
            }
        }
        // Once authorized:
        // The child can no longer sign out of iCloud
        // The child cannot uninstall the Homework app
        // On-device web content filters (built with the Network Extensions framework) can be included in your app and will be installed automaticaly and cannot be removed
        
        // 2a See MyMonitor.swift
        // 2b From the main app, I need to create a Device Activity name and a Device Activity schedule
        MySchedule.setSchedule()
        
        return true
    }
}
