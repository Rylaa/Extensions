import UIKit

 /*
 you can do bold a part in text
 */
func attributedText(withString string: String, boldString: String, font: UIFont, boldFont: UIFont? = nil) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: string,
                                                 attributes: [NSAttributedString.Key.font: font])
    let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: boldFont!]
    let range = (string as NSString).range(of: boldString)
    attributedString.addAttributes(boldFontAttribute, range: range)
    return attributedString
}
