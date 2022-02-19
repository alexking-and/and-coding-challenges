# Challenge 2 - Word Buckets

## Problem
This week's challenge is to write an algorithm which divides a sentence into 'word buckets', where each bucket contains `n` or fewer characters.
Only complete words can be placed into each bucket.
Spaces count as a character, however you should trim leading and trailing spaces from words as they're placed into buckets.
If a word is too large to fit into a bucket, it should be discarded.

### Example
For the following sentence:

```bucketify("the quick brown fox jumps over the lazy dog", 10)```

your algorithm should return:

```["the quick", "brown fox", "jumps over", "the lazy", "dog"]```

* [x] 6 points are awarded for a working algorithm using [this sample problem set](https://pastebin.com/YhrF9YMm)
* [x] 3 points are awarded for an algorithm in under 500 bytes of code (not including input data)
* [x] 2 points are awarded for providing a suite of unit tests

## Solution
Straight forward one this time! I'm saving some functional languages for something more complex, so for now JavaScript seemed like the easiest way to come way under the byte limit.
