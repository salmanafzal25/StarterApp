//
//  Date.swift
//  talkMD-International-Provider
//
//  Created by Ahtazaz on 10/22/20.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit
import Foundation


extension Date {
    func startOfMonth() -> Date? {
        
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        
        let comp: DateComponents = cal.dateComponents([.year, .month, .hour], from: cal.startOfDay(for: self))
        return cal.date(from: comp)!
    }

    func endOfMonth() -> Date? {
        
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        
        var comp: DateComponents = cal.dateComponents([.month, .day, .hour], from: cal.startOfDay(for: self))
        comp.month = 1
        comp.day = -1
        return cal.date(byAdding: comp, to: self.startOfMonth()!)
    }
    
    func startOfMonthHijri() -> Date? {
        
        var cal = Calendar.init(identifier: Calendar.Identifier.islamicUmmAlQura)
        cal.timeZone = TimeZone(abbreviation: "UTC") ?? .current

        let comp: DateComponents = cal.dateComponents([.year, .month, .hour], from: cal.startOfDay(for: self))
        return cal.date(from: comp)!
    }

    func endOfMonthHijri() -> Date? {
        
        var cal = Calendar.init(identifier: Calendar.Identifier.islamicUmmAlQura)
        cal.timeZone = TimeZone(abbreviation: "UTC") ?? .current        
        var comp: DateComponents = cal.dateComponents([.month, .day, .hour], from: cal.startOfDay(for: self))
        comp.month = 1
        comp.day = -1
        return cal.date(byAdding: comp, to: self.startOfMonth()!)
    }
    
}



extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
