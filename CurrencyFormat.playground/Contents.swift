import UIKit

//let cuurentDate = Date()
//print(cuurentDate)
//let weekday = Calendar.current.component(.weekday, from: cuurentDate)
//let f = DateFormatter()
//
//f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
//print(f)
//
//func dayNumberOfWeek() -> Int? {
//    let timeZone = TimeZone(abbreviation: "GMT+3:00")
//    let component =  Calendar.current.dateComponents(in: timeZone!, from: cuurentDate)
//    return  component.day
//}
//print(dayNumberOfWeek() )
//
//
//@propertyWrapper
//struct Storage<T> {
//    let key: String
//    let defaultValue: T
//    private let userDefault = UserDefaults.standard
//
//    var wrappedValue: T {
//        get {
//            return userDefault.object(forKey: key) as? T ?? defaultValue
//        }
//        set {
//            userDefault.set(newValue, forKey: key)
//        }
//    }
//
//    init(key: String, value: T) {
//        self.key = key
//        self.defaultValue = value
//    }
//
//}

let str =  "90/TR/TURKEY"
 let data = str.components(separatedBy: "/")
    data.forEach({ val in
        if let counteryCode = Int(val) {
            print(counteryCode)
        } else if val.count == 2 {
            print(val)
        } else {
            print(val)
        }
    })



func dateStringToDate(_ dateStr: String?) -> Date?  {
     guard let dateStr = dateStr else { return nil }
     let formatter = DateFormatter()
     formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
     formatter.locale = Locale(identifier: "tr_TR")
     formatter.timeZone = TimeZone(abbreviation: "UTC")
     let result = formatter.date(from: dateStr)
     return result
 }
let ss = "12/11/2020 16:55:19"

print(dateStringToDate(ss))
