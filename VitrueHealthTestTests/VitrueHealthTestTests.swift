//
//  VitrueHealthTestTests.swift
//  VitrueHealthTestTests
//
//  Created by Olivier Conan on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import XCTest
@testable import VitrueHealthTest

/// Current unit testing only tests the method `isThisPalindrome`. Rest of the app is native and would not
/// require testing on our side.
/// There are 2 categories, functional testing which will test valid, invalid and special cases and performance testing
/// which will test short, long and very long string against time.
/// `Note`: Baseline average was not set as this is usually used once behaviour

class VitrueHealthTestTests: XCTestCase {

    // MARK: - Functionning tests
    func testValidPalindrome() throws {
        let validLongPalindrome = "tattarrattat"
        XCTAssertTrue(Palindrome.isThisPalindrome(validLongPalindrome))
    }
    
    func testInvalidPalindrome() throws {
        let validLongPalindrome = "tattarrattat but not that much"
        XCTAssertFalse(Palindrome.isThisPalindrome(validLongPalindrome))
    }
    
    func testValidPalindromeWithInvalidCharacters() throws {
        let validLongPalindrome = "\t\ttatt()(*&arrattat  *()(@^"
        XCTAssertTrue(Palindrome.isThisPalindrome(validLongPalindrome))
    }
    
    func testInvalidPalindromeWithInvalidCharacters() throws {
        let validLongPalindrome = "tattarrattat \t but &%_ not that much"
        XCTAssertFalse(Palindrome.isThisPalindrome(validLongPalindrome))
    }

    // MARK: - Performance tests
    func testPerformanceShortPalindrome() throws {
        measure {
            let validLongPalindrome = "tattarrattat"
            _ = Palindrome.isThisPalindrome(validLongPalindrome)
        }
    }
    
    func testPerformanceLongPalindrome() throws {
        measure {
            let validLongPalindrome = "tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat"
            _ = Palindrome.isThisPalindrome(validLongPalindrome)
        }
    }
    
    func testPerformanceVeryLongPalindrome() throws {
        measure {
            let validLongPalindrome = "tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat tattarrattat"
            _ = Palindrome.isThisPalindrome(validLongPalindrome)
        }
    }

}
