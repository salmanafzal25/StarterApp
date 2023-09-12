//
//  UIFont+Extension.swift
//  VaultsPay_iOS
//
//  Created by Ahtazaz Khan on 01/07/2021.
//

import Foundation
import UIKit

struct AppFontName {
   
    
    
    static let black = MOLHLanguage.currentAppleLanguage() == "en" ? "Roboto-Black" : "Roboto-Black"
    static let bold = "Roboto-Bold"
    static let medium = "Roboto-Medium"
    static let semibold = "Roboto-Medium"
    static let regular = "Roboto-Regular"
    static let light = "Roboto-Light"
   
}

extension UIFontDescriptor.AttributeName {
   static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
   static var isOverrided: Bool = false
   
   @objc class func mySystemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
       return UIFont(name: AppFontName.regular, size: fontSize)!
   }
   
   @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
       return UIFont(name: AppFontName.regular, size: size)!
   }
   
   @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
       return UIFont(name: AppFontName.bold, size: size)!
   }
   
   @objc convenience init(myCoder aDecoder: NSCoder) {
       guard
           let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
           let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
           self.init(myCoder: aDecoder)
           
           return
       }
    //CTFontUltraLightUsage,CTFontThinUsage,CTFontLightUsage,CTFontMediumUsage,CTFontDemiUsage
//        print(fontDescriptor)
       var fontName = ""
       switch fontAttribute {
       case "CTFontRegularUsage":
           fontName = AppFontName.regular
       case "CTFontDemiUsage":
           fontName = AppFontName.semibold
       case "CTFontEmphasizedUsage", "CTFontBoldUsage":
           fontName = AppFontName.bold
       case "CTFontMediumUsage":
           fontName = AppFontName.medium
       case "CTFontLightUsage":
           fontName = AppFontName.light
        
       default:
           fontName = AppFontName.regular
       }
       self.init(name: fontName, size: fontDescriptor.pointSize)!
   }
   
   class func overrideInitialize() {
       guard self == UIFont.self, !isOverrided else { return }
       
       isOverrided = true
       
       if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
          let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:))) {
           method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
       }
       
       
       if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
          let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
           method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
       }
       
       if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
          let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
           method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
       }
       
       if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of
          let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
           method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
       }
   }
}
