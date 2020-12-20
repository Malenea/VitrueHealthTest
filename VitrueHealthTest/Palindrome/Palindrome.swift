//
//  Palindrome.swift
//  VitrueHealthTest
//
//  Created by Olivier Conan on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation

/// Multiple solutions could be used to approach that problem. All of them are working, but the intention here
/// was to try to optimise as much as possible the method.
///
/// The basis of the solution is however quite simple, if the array contains an even number of the same letter
/// and at most, one single letter, then the array can be refactored into a palindrome.
/// If the array contains more than 1 single letter, then it cannot be refactored into a palindrome.
///
/// Solutions that were possible:
///
/// - Trim the array from whitespaces and special characters, sort it and count similar letters 2 by 2.
///   Issue: Trim is O(n) and then sort is O(n log n) plus the iteration on the array which would be O(n).
/// - Use a dictionnary to store all counts for each letter, so key for the letter and value for the count.
///   Issue: Parsing the array would be O(n) and then parsing the dictionnary to get the count for each letter
///   would have been another O(n). Though this method would probably be mostly efficient-wise, similar
///   to the current implementation, using a `set` made more sense as we know letters should go by pair,
///   so in the end it's the same as adding - removing instead of having to count each iteration.
/// - Other solutions that were not at all acceptable in terms of complexity or performance and were closer
///   to a brute-force
///
///   Current implementation has some special cases:
///
///   - It does not account for special characters, meaning that
///   only alphabet is taken in account to check if the string is possibly a palindrome. Changing that would be as easy
///   as adding rules in an enum for different cases depending on accepted characters passed as a parameter.
///   That also mean that special character do not count as characters to check for a palindrome and are simply
///   ignored at the moment.
///   - Current implementation is ~ O(n), so if the string is ridiculously long, the method will take way longer. Possible
///   improvement could be to chunck the string and perform the method on each chunck in different concurrent threads.
///   Then simply substract each result set to avoid having to mutex lock a shared set. Though I still have doubts on the
///   efficiency of said method, and practical usage would recommend setting a maximum length instead. Therefor in
///   the current implementation, this issue is not taken in account.
///   Setting a maximum length would also require more testing in order to set the maximum acceptable time threshold.
///

class Palindrome {
    
    /// The solution adopted:
    static func isThisPalindrome(_ array: String) -> Bool {
        /// We could use .count instead in Swift, but .count is O(n), and since we are already parsing at O(n),
        /// that would allow us to only parse our array once.
        var count: Int = 0
        
        /// Usage of Set in Swift is pretty much similar to a dictionary, only difference is that you can't have
        /// duplicates. Search, insert and delete are both O(1), and our set would be limited to alphabet anyways.
        var referenceSet: Set<String> = []
        
        for char in array.unicodeScalars {
            /// Removing all characters that are not in range a-z. Also there, common practice would be to use
            /// `.trimmingCharacters(in: <#T##CharacterSet#>)` but this also has a O(n) complexity added.
            guard CharacterSet.letters.contains(char) else { continue }
            
            /// - Normalizing all characters so they can be compared
            /// - Removing the character from the set either sends back the character and removes it if it was found
            ///   or nil if it wasn't in the set. `else` condition allows us to add it if it wasn't in the set.
            if let referenceChar = referenceSet.remove(String(char).lowercased()) {
                print("removing \(referenceChar)")
            } else {
                print("adding \(char)")
                referenceSet.insert(String(char).lowercased())
            }
            print("left \(referenceSet)")
            
            /// Keeping our count up-to-date
            count += 1
        }
        
        /// We first assess if the array's count is even or odd. If it's even, then the reference set count should be empty for
        /// the array to be palindrome compliant. Else if the array is odd, then it should have 1 single letter or less, extra for
        /// the array to be palindrome compliant. If it does not fit in any of those 2 cases, then the array is not palindrome
        /// compliant.
        //let isValid = (count % 2 == 0) && referenceSet.isEmpty ? true : (!(count % 2 == 0) && referenceSet.count <= 1 ? true : false)
        let isEven: Bool = count % 2 == 0
        if (isEven && referenceSet.isEmpty) || !isEven && referenceSet.count <= 1 {
            return true
        }
        
        //return isValid
        return false
    }
    
}
