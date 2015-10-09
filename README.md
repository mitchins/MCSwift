# MCSwift

A collection of simple utilities and extensions for Swift.
I wrote this because I found I re-used similar utilities over and over.

It provides utilities for:

* Initialising objects like NSDateFormatter with less code
* Number and bool operations
* Date/Time utilities and converters
* UIKit ease like UIScrollView and UIViewController

This will expand over time, and anyone can contribute

As of writing, it is build for Swift 2.0, compatability on Swift 1.x is unknown and unsupported.

## Usage

### Numbers - Squash Between
Given two comparable objects, the lower and upper value on a closed interval, will return the lower threshold if the value is below or the upper threshold if the value is above, the value itself if it falls between.

	let x = 11
	NSLog("The squashed value is %d",x.squashBetween(0,10))
	
Would produce `The squashed value is 10`

Since CGFloat is technically a struct and *NOT* a comparable it has its own parallel, but separate implementation, usage is identical.

### Bool - toggle
Pretty simple, given a mutable bool, this will invert the value of the callee. Identical infunctionality to bool ^= true (not supported in Swift 2.0)

	var myBool = false
	myBool.toggle()
	
The bool now has a value of `true`, works vice versa.
    
* * *

### NSDate - addDays

Will add the specified number of days to the NSDate, thereby advancing or decrementing it on the calendar.

	let today = NSDate()
	let tomorrow = today.addDays(1)
	let yesterday = tomorrow.addDays(-2)
	
As you can see it is immutable, and returns a new date.

### NSDate - daysSinceEpoch

Having the number of seconds since the Unix epoch of 1970 is useful, but sometimes you want to know what day number something is on to easily bucket them into an associative container or even use tableView sections without costly or awkward date functions.

	let today = NSDate()
	let dayNumber = today.daysSinceEpoch
	
dayNumber will not be equal to the number of days elapsed since 01/01/1970, sharing the same integer as any other point in time today.

*N.B.* This uses the local timeZone to determine which day the time is, because the epoch value in UTC could be on the day before or after your local time, depending on your GMY offset.

### NSTimeInterval - minutes/hours/days
	func someDateFunction(pastDate: aDate) {
		let now = NSDate()
		let timeInterval = now.timeIntervalSinceDate(aDate)
		let minutes = timeInterval.minutes
		if(timeInterval.minutes >= 0) {
			NSLog("aDate was %ld minutes ago",minutes)
		} else {
			NSLog("aDate is %ld minutes in the future!",minutes)
		}
	}
	
To get the number of minutes: `aTimeInterval.minutes`

To get the number of hours: `aTimeInterval.hours`

To get the number of days: `aTimeInterval.days`

Note that these return the whole number of days or hours or minutes, e.g. 25 hours will be 1 day, and 25 hours, not 1 day and 1 hours, the components are distinct, not modulo.


### NSDateFormatter - convenience

These two convenience initialisers aim to reduce uncessary lines of code for setting the date/time string or style type.

With a date/time format string:

	let x = NSDateFormatter("YYYY-MM-dd", isRelative: false)
it will default to using relative as true, e.g. 'Today' and 'Yesterday'


With a date and/time pre-canned format style.

	let x = NSDateFormatter(.ShortStyle,timeStyle: .MediumStyle, isRelative: false)
it will default to using relative as true, e.g. 'Today' and 'Yesterday'
  
* * *

### UIScrollView - pageNumber:Int
When using a UIScrollView, you may need to calculate the page number based on the scrollView. This convenience method takes the content size divided by the frame size (width that is) and that's the number of pages. It even clamps it between the interval of 0 to the number of pages incase the content offset has 'bounced' before or after valid content.

    func scrollViewDidScroll(scrollView: UIScrollView) {
    	let currentPageNumber = scrollView.pageNumber
    	self.pageControl.currentPage = currentPageNumber
    }


### UIViewController - firstViewController
When dealing with UIViewController or a possible UINavigationController being a subclass of UIViewController, you don't know which it is from a prepareForSegue (or possible other scenario).
It would be ugly and messy code to have to write if statements just because your storyboard segue may or may not be wrapped in a UINavigationController - even though the underlying view controller that's presented is identical. 

So here's a fairly simple solution, this extension on UIViewController, will take a class type to test against, and if it is a UINavigationController, will evaluate the top view controller, or it if is a UIViewController will evaluate itself, in either case when the desired class is the segue.destinationViewController or segue.destiantionViewController.topViewController, if it fails the optional will be nil; no harm, no foul.

    override func prepareForSegue(segue: UIStoryboardSegue, sender sender: AnyObject?) {
    	if let desiredVC = segue.destinationViewController.firstViewController(MyClass) {
    		desiredVC.someProperty = self.someProperty
    	}
    }
