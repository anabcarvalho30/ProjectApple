import Foundation
import SwiftData

//Esse protocolo Identifiable pede uma propriedade id!
//Assim como View também é um protocolo.

@Model
class Task{
    var title: String
    var date: Date
    var isDone: Bool = false
    var category: String = ""
    
    init(title: String, date: Date, isDone: Bool = false) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
