//
//  DateTime.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation

// MARK: - NSDate Convenience
public extension NSDate {
    /**
    Generate a new date based adding (or subtracting) the number of days passed to it.
    
    - parameter days: The positive or negative number of days to add to the current receiver.
    
    - returns: An entirely new date who is shifted by the number of days supplied.
    */
    public func addDays(days: Int) -> NSDate {
        let components = NSDateComponents()
        components.day = days
        //In my opinion, give an NSDate, and an integer number of days, this should never fail unless the framework dies
        return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue:0) )!
    }
    
    /// Converts the NSDate to the number of (whole) days since the epoch.
    var daysSinceEpoch: Int64 {
        let timeInterval = self.timeIntervalSince1970 + NSTimeInterval(NSTimeZone.systemTimeZone().secondsFromGMT)
        return timeInterval.days
    }
}

// MARK: - NSTimeInterval Convenience
public extension NSTimeInterval {
    /// Returns the time interval as the number of (whole) minutes. (Does not care about hours or days)
    public var minutes: Int64 {
        return Int64(self)/60
    }
    
    /// Returns the time interval as the number of (whole) hours. (Does not care about days)
    public var hours: Int64 {
        return minutes/60
    }
    
    /// Returns the time interval as the number of (whole) days.
    public var days: Int64 {
        return hours/24
    }
}

// MARK: - NSDateFormatter Convenience
public extension NSDateFormatter {
    /**
    Creates an NSDateFormatter using a completely custom date format string.
    
    - parameter dateFormat: Value to be used by the dateFormat property.
    - parameter isRelative: Value to be used by doesRelativeDateFormatting property. (defaults to false)
    
    */
    public convenience init(dateFormat: String, isRelative: Bool = false) {
        self.init()
        self.dateFormat = dateFormat
        self.doesRelativeDateFormatting = isRelative
    }
    
    /**
    Creates an NSDateFormatter using the standard date and time styles.
    
    - parameter dateStyle:  Value to be used by dateStyle property.
    - parameter timeStyle:  Value to be used by timeStyle property.
    - parameter isRelative: Value to be used by doesRelativeDateFormatting property. (defaults to false)
    
    */
    public convenience init(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle, isRelative: Bool = false) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.doesRelativeDateFormatting = isRelative
    }
}