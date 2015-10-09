//
//  UIKit.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation
import UIKit

//UIKit
extension UIScrollView {
    var pageNumber:Int {
        let numberPages = Int(self.contentSize.width / self.frame.size.width)
        return Int(round(self.contentOffset.x/self.frame.size.width)).squashBetween(0, upper: numberPages - 1)
    }
}

/**
This will check that either we are a viewcontroller of this type and return the optional cast
OR
This will check that if we are a naivgation controller, that our top view controller passes the same test
Thus abstracting whether it is the view controller of a navigation controller or view controller itself comforms to T
*/
extension UIViewController {
    func firstViewController<T where T: UIViewController>(type: T.Type) -> T?{
        return ( (self as? UINavigationController)?.topViewController as? T) ?? (self as? T)
    }
}