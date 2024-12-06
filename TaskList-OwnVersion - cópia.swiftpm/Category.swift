import UIKit
import SwiftData
import SwiftUICore

@Model
class Category{
    var name: String
    var color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
