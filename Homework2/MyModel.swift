import Foundation
import FamilyControls

class MyModel: ObservableObject {
    @Published var selectionToDiscourage: FamilyActivitySelection
    
    init() {
        selectionToDiscourage = FamilyActivitySelection()
    }
}
