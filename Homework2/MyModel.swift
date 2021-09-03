import Foundation
import FamilyControls

private let _MyModel = MyModel()

class MyModel: ObservableObject {
    @Published var selectionToDiscourage: FamilyActivitySelection
    @Published var selectionToEncourage: FamilyActivitySelection
    
    init() {
        selectionToDiscourage = FamilyActivitySelection()
        selectionToEncourage = FamilyActivitySelection()
    }
    
    class var shared: MyModel {
        return _MyModel
    }
    
    // Now that I have the guardian's discouraged app selection stored in my app's model, I'll jump back to the Device Monitor extension (MyMonitor.swift)
}
