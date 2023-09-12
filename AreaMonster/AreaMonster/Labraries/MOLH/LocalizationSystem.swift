

import Foundation
import UIKit

class LocalizationSystem:NSObject {
    
    var bundle: Bundle!
    
    class var shared: LocalizationSystem {
        struct Singleton {
            static let instance: LocalizationSystem = LocalizationSystem()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    /// Sets the desired language of the ones you have.
    /// If this function is not called it will use the default OS language.
    /// If the language does not exists y returns the default OS language.
    func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restrat
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }
    
}

extension UILabel{
    

    @IBInspectable var translateWith: String {
        get {
            return self.translateWith
        }
        set {
            self.setLocalizedText(key: newValue)
        }
    }

    
    func setLocalizedText(key: String){
        self.text = LocalizationSystem.shared.localizedStringForKey(key: key, comment: "")
    }
    
    func Capitalized(){
        self.text = self.text?.capitalized
    }
}

extension UIButton{
    
    @IBInspectable var flipNeeded: Bool {
        get {
            return self.flipNeeded
        }
        set {
            self.setImage(self.currentImage?.flipIfNeeded(), for: .normal)
        }
    }
    
    @IBInspectable var translateWith: String {
        get {
            return self.translateWith
        }
        set {
            self.setLocalizedTitle(key: newValue)
        }
    }
    
    
    @IBInspectable var accessibilityString: String? {
        get {
            return self.accessibilityString
        }
        set {
            self.accessibilityValue = newValue?.localizedString
        }
    }

    func setLocalizedTitle(key: String){
        self.setTitle(LocalizationSystem.shared.localizedStringForKey(key: key, comment: ""), for: .normal)
    }
}

extension UIButton {
  
    func addLeftRightPadding(_ padding: CGFloat) {
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: -padding)
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: padding)
    }
}

extension UIBarButtonItem{
    @IBInspectable var translateWith: String {
        get {
            return self.translateWith
        }
        set {
            self.setLocalizedTitle(key: newValue)
        }
    }
    
    func setLocalizedTitle(key: String){
        self.title = LocalizationSystem.shared.localizedStringForKey(key: key, comment: "")
    }
}


extension UITextField{
    @IBInspectable var translatePlaceholderWith: String {
        get {
            return self.translatePlaceholderWith
        }
        set {
            self.setLocalizedPlaceholder(key: newValue)
        }
    }
    
    func setLocalizedPlaceholder(key: String){
        self.placeholder = LocalizationSystem.shared.localizedStringForKey(key: key, comment: "")
    }
}


extension UIImageView{
    @IBInspectable var flipNeeded: Bool {
        get {
            return self.flipNeeded
        }
        set {
            self.image = self.image?.flipIfNeeded()
        }
    }
}


extension String{
    func translate(with key: String)->String{
       return LocalizationSystem.shared.localizedStringForKey(key: key, comment: "")
    }
}




//MARK:- Change number to local

extension String {
    private static let formatter = NumberFormatter()

    func clippingCharacters(in characterSet: CharacterSet) -> String {
        components(separatedBy: characterSet).joined()
    }

    func convertedDigitsToLocale() -> String {

        let locale =  Locale(identifier: MOLHLanguage.currentAppleLanguage())
        let digits = Set(clippingCharacters(in: CharacterSet.decimalDigits.inverted))
        guard !digits.isEmpty else { return self }

        Self.formatter.locale = locale

        let maps: [(original: String, converted: String)] = digits.map {
            let original = String($0)
            let digit = Self.formatter.number(from: original)!
            let localized = Self.formatter.string(from: digit)!
            return (original, localized)
        }

        return maps.reduce(self) { converted, map in
            converted.replacingOccurrences(of: map.original, with: map.converted)
        }
    }
    
    func convertedDigitsToLocale(_ locale: Locale = .current) -> String {
        let digits = Set(clippingCharacters(in: CharacterSet.decimalDigits.inverted))
        guard !digits.isEmpty else { return self }

        Self.formatter.locale = locale

        let maps: [(original: String, converted: String)] = digits.map {
            let original = String($0)
            let digit = Self.formatter.number(from: original)!
            let localized = Self.formatter.string(from: digit)!
            return (original, localized)
        }

        return maps.reduce(self) { converted, map in
            converted.replacingOccurrences(of: map.original, with: map.converted)
        }
    }
}

//
//extension String {
//    private static let formatter = NumberFormatter()
//
//    func clippingCharacters(in characterSet: CharacterSet) -> String {
//        components(separatedBy: characterSet).joined()
//    }
//
//    func convertedDigitsToLocale(_ locale: Locale = .current) -> String {
//        let digits = Set(clippingCharacters(in: CharacterSet.decimalDigits.inverted))
//        guard !digits.isEmpty else { return self }
//
//        Self.formatter.locale = locale
//
//        let maps: [(original: String, converted: String)] = digits.map {
//            let original = String($0)
//            let digit = Self.formatter.number(from: original)!
//            let localized = Self.formatter.string(from: digit)!
//            return (original, localized)
//        }
//
//        return maps.reduce(self) { converted, map in
//            converted.replacingOccurrences(of: map.original, with: map.converted)
//        }
//    }
//}
