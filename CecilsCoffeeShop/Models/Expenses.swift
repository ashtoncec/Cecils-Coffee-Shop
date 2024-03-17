
import Foundation

struct Expenses: Identifiable{
    
    var id: String = UUID().uuidString
    var sourceName: String
    var amount: Double
    var description: String
    
}
