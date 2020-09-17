import UIKit

extension String {
    
    // usage  self.enteredAmount = String(Double((sender.text ?? "0").getCleanNumberString()) ?? 0 / 100)
    func getCleanNumberString() -> String {
        return self.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted).joined()
    }
    
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "₺"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex?.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "") ?? ""
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        /*guard number != 0 as NSNumber else {
         return ""
         }*/
        
        return formatter.string(from: number)!
    }
    
}
