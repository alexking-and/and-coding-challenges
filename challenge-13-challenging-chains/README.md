# Challenge 13 - Challenging Chains

## Problem
For a chain which is considered ‘unbroken’, all parts of the chain can be reached without exiting the chain.
For example, in this diagram:
```
#######
#
#
```
there is 1 unbroken chain.
However, in this diagram:
```
### #######

          #
```
there are actually 3 distinct unbroken chains.

Your task is to write a program which can determine how many separate chains exist in [this input problem](https://pastebin.com/kD4nP19V).
You can assume that links can only be connected vertically and horizontally (not diagonally) and that no two chains touch one another.

* [ ] 5 points are awarded for a working solution
* [ ] 3 points are awarded for a solution which returns in less than 0.25s
* [ ] 2 points are awarded for also returning the total length of chain in the input

## Solution
Didn't have time to complete this unfortunately, but my plan was to basically brute-force it (by going through each cell in the input and checking if it was connected to an already-found chain) and hope that the speed of C++ would keep it under the time limit.
