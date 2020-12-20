# VitrueHealthTest

## Reflexion:

Multiple solutions could be used to approach that problem. All of them are working, but the intention here
was to try to optimise as much as possible the method.

The basis of the solution is however quite simple, if the array contains an even number of the same letter
and at most, one single letter, then the array can be refactored into a palindrome.
If the array contains more than 1 single letter, then it cannot be refactored into a palindrome.

Solutions that were possible:
- Trim the array from whitespaces and special characters, sort it and count similar letters 2 by 2.
  Issue: Trim is O(n) and then sort is O(n log n) plus the iteration on the array which would be O(n).
- Use a dictionnary to store all counts for each letter, so key for the letter and value for the count.
  Issue: Parsing the array would be O(n) and then parsing the dictionnary to get the count for each letter
  would have been another O(n). Though this method would probably be mostly efficient-wise, similar
  to the current implementation, using a `set` made more sense as we know letters should go by pair,
  so in the end it's the same as adding - removing instead of having to count each iteration.
- Other solutions that were not at all acceptable in terms of complexity or performance and were closer
  to a brute-force
  
## Current implementation:

The current implementation works in a simple way. We iterate through our string, for each character encountered if it
already exist in our set we remove it, else we add it.
Since all character iterations should be in pairs and leftover should be 1 character max if the count of the string is
odd for the result to be true, we can simply work in an add-remove mechanic to assess a pair instead of counting them
and % 2.
Whitespaces, special characters are ignored and don't count for the end result.

Set is O(1), wether it's search, insert or delete. Iterating through the array is O(n). The count on the set used in the
end to assess if the array is odd or even is O(1).

Current implementation has some special cases:
  - It does not account for special characters, meaning that
  only alphabet is taken in account to check if the string is possibly a palindrome. Changing that would be as easy
  as adding rules in an enum for different cases depending on accepted characters passed as a parameter.
  That also mean that special character do not count as characters to check for a palindrome and are simply
  ignored at the moment.
  - Current implementation is ~ O(n), so if the string is ridiculously long, the method will take way longer. Possible
  improvement could be to chunck the string and perform the method on each chunck in different concurrent threads.
  Then simply substract each result set to avoid having to mutex lock a shared set. Though I still have doubts on the
  efficiency of said method, and practical usage would recommend setting a maximum length instead. Therefor in
  the current implementation, this issue is not taken in account.
  Setting a maximum length would also require more testing in order to set the maximum acceptable time threshold.
  
  
## Testing

### Unit testing

Implementation of basic unit testing. Since we only have one method here, we implement both functional and performance tests
for it. Those tests being: 

. Functional:
  - Unit test on a valid palindrome without invalid characters
  - Unit test on an invalid palindrome without invalid characters
  - Unit test on a valid palindrome with invalid characters
  - Unit test on an invalid palindrome with invalid characters

. Performance:
  - Unit test on a short valid palindrome
  - Unit test on a long valid palindrome
  - Unit test on a very long valid palindrome
  
`Note`: Performance test was not set with a baseline average as this would make no sense in this case. But setting a baseline
average is pretty useful when you want to keep track of your aimed time.

### UI testing

Implementation of basic UI testing. Since we have basically no UI here appart from a single textfield and a label, the UI test
is just about launching the app, clicking on the textfield, inputing a text, and validating.
It allows us to assess the flow in a BDD format, and though most people tend to not want to implement UI testing, if combined
with `fastlane`, could allow to easily implement `snapshot` to take a flow full screens as screenshots.
