# Challenge 7 - Caesar Cypher

## Problem
It was said that Julius Caesar protected his private documents by encrypting them using a cipher.
The cypher works by taking each letter of the input text and shifting it by a number of letters.
If the shift takes the letter past the end of the alphabet then it moves back to the beginning of the alphabet.
In the case of a shift by `2`, `w`, `x`, `y`, `z` would map to `y`, `z`, `a`, `b`.  Case ought to be preserved, and any non-(A-Z/a-z) characters are left unmodified.

The challenge this week is to encrypt the entirety of [Jane Austen's "Pride and Prejudice"](https://github.com/alexkitch/and-challenges/blob/master/prideAndPrejudice.txt) as fast as possible (without using any compile-time pre-computation).

* [x] 5 points are awarded for encoding the book in under 500ms
* [x] 2 points are awarded for encoding the book in under 100ms
* [x] 2 points are awarded for encoding the book in under 50ms
* [ ] The remaining 1 point is awarded to the fastest submission

## Solution
My plan was to create a quick and dirty reference implementation in C and then see where to go from there, but it turns out the C implementation is already good enough to meet the requirements.
When writing the output to a file, it takes around ~60ms, but when not writing the output anywhere it takes around 20-25ms.
There's pretty much no optimisations I can make at this point either, short of rewriting the core loop in assembly; I tried pre-calculating an array for char conversions rather than performing them per encounter, but that didn't save any significant time.
