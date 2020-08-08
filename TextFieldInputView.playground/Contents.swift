import UIKit

func setInputViewPicker(target: Any, selector: Selector,_ leftText:String? = nil, leftSelector: Selector? = nil) {
    
    let screenWidth = UIScreen.main.bounds.width
    let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
    toolBar.barTintColor = UIColor.fadedBlue
    let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let left = leftText == nil ? nil :  UIBarButtonItem(title: leftText!, style: .plain, target: nil, action: leftSelector)
    let barButton = UIBarButtonItem(title: MMDatePicker.ToolBarClose, style: .plain, target: target, action: selector)
    barButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white,
                                      NSAttributedString.Key.font:Theme.FontBase.semibold14.font], for: .normal)
    
    if left == nil {
        toolBar.setItems([flexible, barButton], animated: false)
    }else{
        left!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white,
                                      NSAttributedString.Key.font:Theme.FontBase.semibold14.font], for: .normal)
        toolBar.setItems([left!, flexible, barButton], animated: false)
    }
    self.inputAccessoryView = toolBar
}
