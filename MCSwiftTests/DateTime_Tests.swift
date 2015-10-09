//
//  DateTime_Tests.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import XCTest

class DateTime_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /**
    Test NSTimeInterval functions
    **/
    
    func testTimeIntervalMinutes() {
        //The zero case
        var timeInterval = NSTimeInterval(0)
        var expected = Int64(0)
        XCTAssert(timeInterval.minutes == expected)
        
        //The "do not round up" case
        timeInterval = NSTimeInterval(59)
        expected = Int64(0)
        XCTAssert(timeInterval.minutes == expected)
        
        //The simple case of a few minutes and some change case
        timeInterval = NSTimeInterval(181) //3 minutes, 1 second
        expected = Int64(3)
        XCTAssert(timeInterval.minutes == expected)
        
        //Make sure it doesn't do anything funny if there are hours involved too
        timeInterval = NSTimeInterval(3601) //1 hour, 1 second
        expected = Int64(60)
        XCTAssert(timeInterval.minutes == expected)
        
        //Pick a largish kind of number in the negative to make sure that doesn't mess it up
        timeInterval = NSTimeInterval(-3660) //negative 61 minutes
        expected = Int64(-61)
        XCTAssert(timeInterval.minutes == expected)
        
    }
    
    func testTimeIntervalHours() {
        //The zero case
        var timeInterval = NSTimeInterval(0)
        var expected = Int64(0)
        XCTAssert(timeInterval.hours == expected)
        
        //The "do not round up" case
        timeInterval = NSTimeInterval(3599)
        expected = Int64(0)
        XCTAssert(timeInterval.hours == expected)
        
        //The simple case of a few hours and some change case
        timeInterval = NSTimeInterval(10801) // 3 hours, 1 second
        expected = Int64(3)
        XCTAssert(timeInterval.hours == expected)
        
        //Make sure it doesn't do anything funny if there are days involved too
        timeInterval = NSTimeInterval(86401) //1 day, 1 second
        expected = Int64(24)
        XCTAssert(timeInterval.hours == expected)
        
        //Pick a largish kind of number in the negative to make sure that doesn't mess it up
        timeInterval = NSTimeInterval(-172801) //negative 2 days, 1 second
        expected = Int64(-48)
        XCTAssert(timeInterval.hours == expected)
    }
    
    func testTimeIntervalDays() {
        //The zero case
        var timeInterval = NSTimeInterval(0)
        var expected = Int64(0)
        XCTAssert(timeInterval.days == expected)
        
        //The "do not round up" case
        timeInterval = NSTimeInterval(86399)
        expected = Int64(0)
        XCTAssert(timeInterval.days == expected)
        
        //A whole day, and a numbetr of seconds
        timeInterval = NSTimeInterval(86401) //1 day, 1 second
        expected = Int64(1)
        XCTAssert(timeInterval.days == expected)
        
        //Pick a largish kind of number in the negative to make sure that doesn't mess it up
        timeInterval = NSTimeInterval(-1728001) //negative 20 days, 1 second
        expected = Int64(-20)
        XCTAssert(timeInterval.days == expected)
    }
    
    /**
    Test DateTime functions
    **/
    
    func testAddDays()  {
        let dateFormatter = NSDateFormatter(dateFormat: "YYYY-MM-dd")

        //Test the trvial case
        var originalDate = NSDate()
        var expectedDate = originalDate
        var outputDate = originalDate.addDays(0)
        XCTAssert(outputDate.isEqualToDate(expectedDate))
        
        //Test the case of one day to the next, with roll over of month
        originalDate = dateFormatter.dateFromString("2015-01-31")!
        expectedDate = dateFormatter.dateFromString("2015-02-01")!
        outputDate = originalDate.addDays(1)
        XCTAssert(outputDate.isEqualToDate(expectedDate))
        
        //Obligatory leap year test
        originalDate = dateFormatter.dateFromString("2016-02-28")!
        expectedDate = dateFormatter.dateFromString("2016-03-01")!
        outputDate = originalDate.addDays(2)
        XCTAssert(outputDate.isEqualToDate(expectedDate))
        
        //Test the case of going backwards, from one year to the previous, over multiple months
        originalDate = dateFormatter.dateFromString("2015-01-02")!
        expectedDate = dateFormatter.dateFromString("2014-11-14")!
        outputDate = originalDate.addDays(-49)
        XCTAssert(outputDate.isEqualToDate(expectedDate))
    }
    
    func testDaysSinceEpoch() {
        let secondsFromGMT = NSTimeInterval(NSTimeZone.systemTimeZone().secondsFromGMT)
        //Test the trvial case
        var date = NSDate(timeIntervalSince1970: secondsFromGMT)
        var expected = Int64(0)
        XCTAssert(date.daysSinceEpoch == expected )
        
        //Test a day in the future
        date = NSDate(timeIntervalSince1970: secondsFromGMT + (24 * 60 * 60) )
        expected = Int64(1)
        XCTAssert(date.daysSinceEpoch == expected )
        
        //Test a day in the past
        date = NSDate(timeIntervalSince1970:  -secondsFromGMT + (-24 * 60 * 60) )
        expected = Int64(-1)
        XCTAssert(date.daysSinceEpoch == expected )
        
        //Test a week in the past
        date = NSDate(timeIntervalSince1970:  -secondsFromGMT + (-7 * 24 * 60 * 60) )
        expected = Int64(-7)
        XCTAssert(date.daysSinceEpoch == expected )
    }
    
    /**
    Test NSDateFormatter conveniences
    **/
    
    func testNSDateFormatterConveniences() {
        //        convenience init(dateFormat: String, isRelative: Bool = false) {
        //        convenience init(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle, isRelative: Bool = false) {

        
        XCTFail("Not Implemented")
    }
}
