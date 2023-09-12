//
//  UILabel.swift
//  talkMD-International-Provider
//
//  Created by Ahtazaz on 11/3/20.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit

extension UILabel {
    
    func underline() {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
          attributedText = attributedString
        }
    }
    
}





extension UILabel {
    
    @IBInspectable var flipNeeded: Bool {
        get {
            return self.flipNeeded
        }
        set {
            
            let language =  MOLHLanguage.currentAppleLanguage()
            self.textAlignment = language == "en" ? .left : .right
        
        }
    }
}



class EdgeInsetLabel: UILabel {
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
