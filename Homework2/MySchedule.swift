import Foundation
import DeviceActivity

// The Device Activity name is how I can reference the activity from within my extension
extension DeviceActivityName {
    // I've set the name of my activity to daily
    static let daily = Self("daily")
}

// The Device Activity schedule represents the time bounds in which my extension will monitor for activity
let schedule = DeviceActivitySchedule(
    // I've set my schedule to start and end at midnight
    intervalStart: DateComponents(hour: 0, minute: 0),
    intervalEnd: DateComponents(hour: 12, minute: 59),
    // I've also set the schedule to repeat
    repeats: true
)

class MySchedule {
    static public func setSchedule() {
        print("Setting schedule...")

        // Finally, I can create a Device Activity center
        let center = DeviceActivityCenter()
        do {
            // Call startMonitoring with the activity name and schedule
            try center.startMonitoring(.daily, during: schedule)
        } catch {
            print("Error monitoring schedule")
        }
    }
}

// Another ingredient to shielding apps is figuring out what the guardian wants to discourage
// The Family Controls framework has a SwiftUI element for this: the family activity picker
