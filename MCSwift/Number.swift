//
//  Number.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation
import UIKit

// MARK: - CGFloat Conveniences
public extension CGFloat {
    /**
     Generates a value that given a closed intervals, will be within the bounds, as close to the original value as possible.
     
     - parameter lower: The lowest value allowed in the closed interval
     - parameter upper: The highest value allowed in the closed interval
     
     - returns: The original value if it already satisfied the range, or the nearest value on the closed interval.
     */
    public func squashBetween(lower: CGFloat, upper: CGFloat) -> CGFloat{
        var result = self
        if self < lower {
            result = lower
        } else if self > upper{
            result = upper
        }
        return result
    }
}

// MARK: - Comparable Conveniences
public extension Comparable {
    /**
     Generates a value that given a closed intervals, will be within the bounds, as close to the original value as possible.
     
     - parameter lower: The lowest value allowed in the closed interval
     - parameter upper: The highest value allowed in the closed interval
     
     - returns: The original value if it already satisfied the range, or the nearest value on the closed interval.
     */
    public func squashBetween(lower: Self, upper: Self) -> Self{
        return max(lower,min(upper,self))
    }
}

// MARK: - Bool Conveniences
public extension Bool {
    /**
     Inverts the current value, is equivalent to bool ^= true. Mutating.
     */
    public mutating func toggle() {
        self = !self
    }
}

