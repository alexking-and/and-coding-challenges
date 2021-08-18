# Challenge 9 - Hllo Worl

## Problem
You’re typing out a message to a colleague on Slack when suddenly disaster strikes - you knock a cup of coffee all over your keyboard, rendering many of the keys inoperative.
Given a list of keys on the keyboard which are still working, the challenge is to write a program which can determine the longest English-language word you can type using those letters.
[A dictionary of words can be found here](http://norvig.com/ngrams/enable1.txt).
Some key sets may have multiple solutions - returning the first is acceptable, although feel free to return a list of all solutions.

* [x] 5 points are awarded for a working solution
* [x] 3 points are awarded for a solution which takes under 1 second to return its result
* [x] 2 points are awarded for a solution in under 100 lines of code

### Example
Given the following letters:
`hewsda`

The expected output is:
`deadheaded` (or also `hasheeshes`)

## Solution
At seeing the performance requirement, my mind instinctively went to C, but, since the problem seemed very recursion-friendly, I decided to pick another functional language from my to-use list and landed on Common Lisp.
Lisp was pretty painful to setup (especially since, as I didn't even know before, that Lisp is more of a 'spec' than an actual language implementation in its own right), and most of the documentation out there is hideous, but at least it's very straight-forward functional programming once your in.

I got an initial solution and thought "all right, I'll see if this runs in any sort of reasonable time and then look into optimisations from there":
```
* (time (hllo-worl:longest-word "hewsda" "dict.txt"))
Evaluation took:
  0.114 seconds of real time
  0.107124 seconds of total run time (0.101671 user, 0.005453 system)
  [ Run times consist of 0.021 seconds GC time, and 0.087 seconds non-GC time. ]
  93.86% CPU
  296,352,342 processor cycles
  46,260,272 bytes consed
  
"deadheaded"
```
"Oh." Yeah, turns out Lisp doesn't mess around and I was able to come _well_ under the time and line limit on the first attempt.
Glad I tried out Lisp, although if I revisit it in the future it'll probably be with a more popular variant such as Clojure.

Run with however you want to handle Lisp. For me, it was installing [sbcl](http://www.sbcl.org/), installing `quicklisp`, copying this directory into quicklisp's local projects directory, then running with:
```
rlwrap sbcl
* (ql:quickload :hllo-worl)
* (hllo-worl:longest-word "hewsda" "dict.txt")
```
