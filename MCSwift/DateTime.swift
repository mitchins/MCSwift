//
//  DateTime.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation

/**
Convenience for NSDate
*/
extension NSDate {
    
    func addDays(days: Int) -> NSDate {
        let components = NSDateComponents()
        components.day = days
        //In my opinion, give an NSDate, and an integer number of days, this should never fail unless the framework dies
        return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue:0) )!
    }
    
    var daysSinceEpoch: Int64 {
        let timeInterval = self.timeIntervalSince1970 + NSTimeInterval(NSTimeZone.systemTimeZone().secondsFromGMT)
        return timeInterval.days
    }
}

/**
Allows one central place to define both the conversion units and direct access via NSTimeUnterval to seem organic
*/
extension NSTimeInterval {
    var minutes: Int64 {
        return Int64(self)/60
    }
    
    var hours: Int64 {
        return minutes/60
    }
    
    var days: Int64 {
        return hours/24
    }
}

//useless here but normally a handy thing, add somewhere
extension NSDateFormatter {
    convenience init(dateFormat: String, isRelative: Bool = false) {
        self.init()
        self.dateFormat = dateFormat
        self.doesRelativeDateFormatting = isRelative
    }
    convenience init(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle, isRelative: Bool = false) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.doesRelativeDateFormatting = isRelative
    }
}