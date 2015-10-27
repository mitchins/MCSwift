//
//  Numbers_Tests.swift
//  Extension Tests
//
//  Created by Mitchell Currie on 7/10/2015.
//
//

import XCTest
import MCSwift

class Numbers_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
/**
    Because CGFlaot is technically a struct, we cannot test it as we would comparable and have created an identical test
**/
    
    func testSquashBetweenFloatTrivial() {
        let input = CGFloat(1)
        //Test trivial case where the number is already inside the range
        let expected = CGFloat(1)
        var output = input.squashBetween(0, upper: 2)
        
        XCTAssert(output == expected)
        
        //Test same trvial case but on boundaries
        output = input.squashBetween(0, upper: 1)
        XCTAssert(output == expected)
        
        output = input.squashBetween(1, upper: 2)
        XCTAssert(output == expected)
        
        //Test a closed interval with size 1
        output = input.squashBetween(1, upper: 1)
        XCTAssert(output == expected)
        
        //Test a case where the number is outside the range to begin with (above)
    }
    
    func testSquashBetweenFloatAbove() {
        var input = CGFloat(3)
        //Test a case where the number is outside the range to begin with (above)
        var expected = CGFloat(2)
        var output = input.squashBetween(0, upper: 2)
        
        XCTAssert(output == expected)
        
        //Now test across negative to positive range
        expected = CGFloat(1)
        output = input.squashBetween(-1, upper: 1)
        XCTAssert(output == expected)
        
        //Now test an entirely negative range
        expected = CGFloat(-1)
        output = input.squashBetween(-4, upper: -1)
        XCTAssert(output == expected)
        
        //now test closed range of size 1
        input = CGFloat(5)
        expected = CGFloat(1)
        output = input.squashBetween(1, upper: 1)
        XCTAssert(output == expected)
    }
    
    func testSquashBetweenFloatBelow() {
        var input = CGFloat(1)
        //Test a case where the number is outside the range to begin with (above)
        var expected = CGFloat(2)
        var output = input.squashBetween(2, upper: 4)
        XCTAssert(output == expected)
        
        //Now test across negative to positive range
        input = CGFloat(-2)
        expected = CGFloat(-1)
        output = input.squashBetween(-1, upper: 1)
        XCTAssert(output == expected)
        
        //Now test an entirely negative range
        input = CGFloat(-3)
        expected = CGFloat(-2)
        output = input.squashBetween(-2, upper: -1)
        XCTAssert(output == expected)
        
        //now test closed range of size 1
        input = CGFloat(1)
        expected = CGFloat(2)
        output = input.squashBetween(2, upper: 2)
        XCTAssert(output == expected)
    }
    
/**
    In the following we will use plain old int to represent comparable
**/
    
    func testSquashBetweenComparableTrivial() {
        let input = 1
        //Test trivial case where the number is already inside the range
        let expected = 1
        var output = input.squashBetween(0, upper: 2)
        
        XCTAssert(output == expected)
        
        //Test same trvial case but on boundaries
        output = input.squashBetween(0, upper: 1)
        XCTAssert(output == expected)
        
        output = input.squashBetween(1, upper: 2)
        XCTAssert(output == expected)
        
        //Test a closed interval with size 1
        output = input.squashBetween(1, upper: 1)
        XCTAssert(output == expected)
        
        //Test a case where the number is outside the range to begin with (above)
    }
    
    func testSquashBetweenComparableAbove() {
        var input = 3
        //Test a case where the number is outside the range to begin with (above)
        var expected = 2
        var output = input.squashBetween(0, upper: 2)
        
        XCTAssert(output == expected)
        
        //Now test across negative to positive range
        expected = 1
        output = input.squashBetween(-1, upper: 1)
        XCTAssert(output == expected)
        
        //Now test an entirely negative range
        expected = -1
        output = input.squashBetween(-4, upper: -1)
        XCTAssert(output == expected)
        
        //now test closed range of size 1
        input = 5
        expected = 1
        output = input.squashBetween(1, upper: 1)
        XCTAssert(output == expected)
    }
    
    func testSquashBetweenComparableBelow() {
        var input = 1
        //Test a case where the number is outside the range to begin with (above)
        var expected = 2
        var output = input.squashBetween(2, upper: 4)
        XCTAssert(output == expected)
        
        //Now test across negative to positive range
        input = -2
        expected = -1
        output = input.squashBetween(-1, upper: 1)
        XCTAssert(output == expected)
        
        //Now test an entirely negative range
        input = -3
        expected = -2
        output = input.squashBetween(-2, upper: -1)
        XCTAssert(output == expected)
        
        //now test closed range of size 1
        input = 1
        expected = 2
        output = input.squashBetween(2, upper: 2)
        XCTAssert(output == expected)
    }
    
/**
    Now we test boolean
**/
    
    func testBooleanToggle() {
        var theBoolean = false
        //First test toggle from false to true
        var expected = true
        theBoolean.toggle()
        XCTAssert(theBoolean == expected)
        
        //Now test toggling back
        expected = false
        theBoolean.toggle()
        XCTAssert(theBoolean == expected)
        
        //Now test toggling a new bool from false to true
        var anotherBoolean = true
        expected = false
        anotherBoolean.toggle()
        XCTAssert(anotherBoolean == expected)
    }
    
}
