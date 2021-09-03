import DeviceActivity
import ManagedSettings

// 2a. Next up with Homework is shielding the apps the guardian has chosen to discourage on a recurring schedule.
// Since I cannot count on my app to be running on the child's device, I will use a Device Activity Schedule to set the application shield restriction every day, even when Homework hasn't run since being setup by the guardian.
// When my Device Activity Schedule fires, Device Activity will call into a new extension point.
// Homework will include an extension for this extension point where I will set the restriction to shield apps.
// Implementing an extension for this extension point requires you to subclass DeviceActivityMonitor as the principle class.

class MyMonitor: DeviceActivityMonitor {
    // Import ManagedSettings to get access to the application shield restriction
    let store = ManagedSettingsStore()
    
    override init() {
        print("Init DeviceActivityMonitor")
        super.init()
    }
    
    // Here I've overridden two methods in my extension's principle class.
    // These functions will be called the first time the device is used after the start and end of my schedule.
    // I'm going to leave the implementation of these functions emtpy until I've configured my Device Activity Schedule from Homework's main app
    override func intervalDidStart(for activity: DeviceActivityName) {
        print("Interval did start for activity: ", activity)
        super.intervalDidStart(for: activity)
        
        MyModel.shared.setShieldRestrictions()
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        print("Interval did end for activity: ", activity)
        super.intervalDidEnd(for: activity)
        
        // Remove the restrictions by setting them to nil
        store.shield.applications = nil
        store.shield.applicationCategories = nil
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        print("intervalWillStartWarning")
    }
    
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        print("intervalWillEndWarning")
    }
    
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        print("eventDidReachThreshold")
        
        store.shield.applications = nil
    }
    
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        print("eventWillReachThresholdWarning")
    }
}
