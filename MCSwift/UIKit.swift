//
//  UIKit.swift
//  MitchellCurrie.Swift
//
//  Created by Mitchell Currie on 8/10/2015.
//
//

import Foundation
import UIKit

// MARK: - UIScrollView Conveniences
public extension UIScrollView {
    /**
     Checks the scroll position of the contentView, with respect to our current frame and assumes pages are the viewport width.
     Value is then squashed between this, so that it will never be off page during those times you can 'peak' the page out of bounds.
     */
    
    public var pageNumber:Int {
        let numberPages = Int(self.contentSize.width / self.frame.size.width)
        return Int(round(self.contentOffset.x/self.frame.size.width)).squashBetween(lower: 0, upper: numberPages - 1)
    }
}

// UIViewController: - UIScrollView Conveniences
public extension UIViewController {
    /**
     Evaluate ourself if a UIViewController( or our topViewController if a UINavigationController) to be of type T.
     
     - parameter type: The class of the ViewController you wish to search for.
     
     - returns: An optional value, containing the ViewController if it is either us or as a navigation controller our topViewController.
     */
    public func firstViewController<T>(type: T.Type) -> T? where T: UIViewController{
        return ( (self as? UINavigationController)?.topViewController as? T) ?? (self as? T)
    }
}

