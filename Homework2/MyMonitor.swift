import DeviceActivity

// 2a. Next up with Homework is shielding the apps the guardian has chosen to discourage on a recurring schedule.
// Since I cannot count on my app to be running on the child's device, I will use a Device Activity Schedule to set the application shield restriction every day, even when Homework hasn't run since being setup by the guardian.
// When my Device Activity Schedule fires, Device Activity will call into a new extension point.
// Homework will include an extension for this extension point where I will set the restriction to shield apps.
// Implementing an extension for this extension point requires you to subclass DeviceActivityMonitor as the principle class.

class MyMonitor: DeviceActivityMonitor {
    // Here I've overridden two methods in my extension's principle class.
    // These functions will be called the first time the device is used after the start and end of my schedule.
    // I'm going to leave the implementation of these functions emtpy until I've configured my Device Activity Schedule from Homework's main app
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        print("Interval did start for activity: ", activity)
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        print("Interval did end for activity: ", activity)
    }
}
