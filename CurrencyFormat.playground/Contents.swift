import UIKit

extension String {
    // İşCep format
    func formated(_ currency:String = "₺") -> String {
        let str = self
        let amount = Double(str.getCleanNumberString())
        if amount == nil { return "" }
        let formatter = NumberFormatter()
        let iden = "tr_TR"
        let locale = Locale(identifier: iden)
        formatter.locale = locale //Locale.current
        formatter.currencySymbol = currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        let value = amount! / 100
        return formatter.string(from: NSNumber(value: value))!
    }
    
    func getCleanNumberString() -> String {
        return self.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted).joined()
    }
    
}
