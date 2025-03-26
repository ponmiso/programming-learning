import Foundation
import SwiftData

@Model
final class SwiftDataModel: Identifiable {
    var id = UUID()
    var name: String
    var created = Date()

    init(name: String) {
        self.name = name
    }
}
