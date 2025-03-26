import Foundation
import SwiftData

@Model
final class SwiftDataModel: Identifiable {
    var id = UUID()
    var name: String
    var created = Date()
    var sort = 0

    init(name: String, sort: Int) {
        self.name = name
        self.sort = sort
    }
}
