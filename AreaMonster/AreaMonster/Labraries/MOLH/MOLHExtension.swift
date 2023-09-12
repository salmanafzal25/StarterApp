//
//  MOLHExtension.swift
//  AreaMonster
//
//  Created by MAC on 01/08/2023.
//

import Foundation



public extension String {
    /// Return Localized String
    var localizedString : String {
        get {
            return self.toLocal()
        }
    }
}



private extension String {
    func toLocal() -> String {

        
            guard let path = Bundle.main.path(forResource: MOLHLanguage.currentAppleLanguage(), ofType: "lproj") else {
                return self
            }
        if let bundle = Bundle.init(path: path){
            return NSLocalizedString(self, tableName: "Localizable", bundle: bundle, value: "", comment: "")
        }else{
            return self
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
