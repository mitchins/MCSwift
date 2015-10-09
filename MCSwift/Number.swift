//
//  Number.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation
import UIKit

extension CGFloat {
    func squashBetween(lower: CGFloat, upper: CGFloat) -> CGFloat{
        var result = self
        if self < lower {
            result = lower
        } else if self > upper{
            result = upper
        }
        return result
    }
}

extension Comparable {
    func squashBetween(lower: Self, upper: Self) -> Self{
        return max(lower,min(upper,self))
    }
}

extension Bool {
    mutating func toggle() {
        self = !self
    }
}