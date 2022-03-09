# Challenge 2 - Satellites

## Problem
Consider a list of satellites moving through 2D space: `[-2,-1, 1,-2]`

The absolute value of each satellite represents its size, and the sign of the satellite represents its direction of travel (`-` being left, `+` being right).
If two satellites meet, the smaller satellite is destroyed.
If meeting satellites are the same size, both are destroyed.
All satellites are moving at the same speed.

Given this information, the challenge is to write an algorithm capable of determining the final state of [these sample problems](https://pastebin.com/r8aL071P) after all collisions have taken place.

### Example
For the following list of satellites: `[-3, 1, 1,-2, 3,-2]`

The expected output after all collisions is: `[-3,-2, 3]`

* [x] 4 points are awarded for a working algorithm which solves the sample problems
* [x] 3 points are awarded for using only one loop
* [?] 3 points are awarded for using a language unique among other participants

## Solution
You know when you throw a solution together quickly, but then you run the tests and it turns out it... just works? Spooky, but very convenient when I have Elden Ring to get back to.

Run using `cargo run`
