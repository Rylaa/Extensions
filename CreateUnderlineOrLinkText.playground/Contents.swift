import UIKit

let messageLabel = UITextView()

private func setCustomAlertView() {
    messageLabel.text = message
    let attributedString = NSMutableAttributedString(string: messageLabel.text)
    attributedString.addAttribute(.link, value: "https://github.com/" , range: (attributedString.string as NSString).range(of: "text"))
    attributedString.addAttribute(.link, value: "https://github.com/", range: (attributedString.string as NSString).range(of: "SecondText"))
    messageLabel.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                       NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                       NSAttributedString.Key.underlineColor: UIColor.black]
    messageLabel.attributedText = attributedString
    messageLabel.isSelectable = false
    messageLabel.isEditable = false
    messageLabel.delaysContentTouches = false
    messageLabel.isScrollEnabled = false
    messageLabel.isUserInteractionEnabled = false
    messageLabel.textColor = UIColor.black
    messageLabel.font = UIFont()
    
}
