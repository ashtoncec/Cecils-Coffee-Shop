
import Foundation

struct Income: Identifiable{
    
    var id: String = UUID().uuidString
    var sourceName: String
    var amount: Double
    var description: String
    
}
