# Challenge 8 - Challenge VIII

## Problem
For the purposes of this challenge, a Roman numeral is a string of characters in the set `M,D,C,L,X,V,I` where each has a value of `1000,500,100,50,10,5,1` respectively.
Given any two Roman numerals in additive notation*, your task is to write an algorithm which can determine whether the first is less than the second, without using any built-in language features which are capable of decoding Roman numerals (such as Excel’s `ROMAN()` function)

Additive notation refers to a numeral where each character is simply added together to give the final value.
There is also a subtractive notation where 8, for example, would be written as `IIX` rather than `VIII`.
Full details of each notation can be found on [Wikipedia](https://en.wikipedia.org/wiki/Roman_numerals)

* [x] 5 points are awarded for a working solution
* [x] 5 points are awarded for an algorithm which also supports subtractive notation

### Example
Given the following problem:
`compare('VI', 'MMMCXI')`
The expected output is:
`true`

## Solution
Picked D randomly and it actually had some surprisingly nice features (easy unit tests and pure functions!), but it's lack of popularity meant there wasn't a great amount of help out there.
Fortunately, the problem ended up being really easy to solve anyway; additive notation can be parsed just by converting the characters to numbers and summing them, and subtractive notation only has a few exceptions which are easy enough to hard code.

Build and run using `dub` or any other D tools.
