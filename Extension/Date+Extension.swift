
import Foundation

extension Date {
    func toString() -> String{
        let dateFormater = dateFormater()
        dateFormater.dateStyle = .short
        dateFormater.timeStyle = .short

        // for custom date
        // dateFormater.dateFormater = "mm/dd/yyyy"

        let result = dateFormater.string(from : self)
        return result
    }
    
}