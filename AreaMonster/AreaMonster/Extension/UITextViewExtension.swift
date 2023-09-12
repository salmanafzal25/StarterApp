//
//  UITextViewExtension.swift
//  AWQAF UAE
//
//  Created by Mac on 08/08/2022.
//

import UIKit

extension UITextView {

    private class PlaceholderLabel: UILabel { }

    private var placeholderLabel: PlaceholderLabel {
        if let label = subviews.compactMap( { $0 as? PlaceholderLabel }).first {
            return label
        } else {
            let label = PlaceholderLabel(frame: .zero)
            label.textAlignment = .left
            label.textColor = .lightGray
            label.font = font
            addSubview(label)
            return label
        }
    }

    
    @IBInspectable
    var placeholder: String {
        get {
            return subviews.compactMap( { $0 as? PlaceholderLabel }).first?.text ?? ""
        }
        set {
            let placeholderLabel = self.placeholderLabel
            placeholderLabel.text = newValue
            placeholderLabel.numberOfLines = 0
            let width = frame.width - textContainer.lineFragmentPadding * 2
            let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            placeholderLabel.frame.size.height = size.height
            placeholderLabel.frame.size.width = width
            placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top)
            placeholderLabel.textAlignment = MOLHLanguage.currentAppleLanguage() == "en" ? .left : .right
         
            
            textStorage.delegate = self
        }
    }
    
    @IBInspectable
    var placeholderLocalize: String {
        get {
            return subviews.compactMap( { $0 as? PlaceholderLabel }).first?.text ?? ""
        }
        set {
            let placeholderLabel = self.placeholderLabel
            placeholderLabel.text = newValue.localizedString
            placeholderLabel.numberOfLines = 0
            let width = frame.width - textContainer.lineFragmentPadding * 2
            let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            placeholderLabel.frame.size.height = size.height
            placeholderLabel.frame.size.width = width
            placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top)
            placeholderLabel.textAlignment = MOLHLanguage.currentAppleLanguage() == "en" ? .left : .right
         
            
            textStorage.delegate = self
        }
    }
    
    
    @IBInspectable var flipNeeded: Bool {
        get {
            return self.flipNeeded
        }
        set {
            let language = MOLHLanguage.currentAppleLanguage()
            self.textAlignment = language == "en" ? .left : .right
        
        }
    }

}

extension UITextView: NSTextStorageDelegate {

    public func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        if editedMask.contains(.editedCharacters) {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }

}


extension UITextField {
    
    @IBInspectable var flipNeeded: Bool {
        get {
            return self.flipNeeded
        }
        set {
            let language = MOLHLanguage.currentAppleLanguage()
            self.textAlignment = language == "en" ? .left : .right
        
        }
    }
}
