# Challenge 1 - Control-C, Control-V

## Problem
The challenge is to analyse [these strings](data.txt) for any instances of `[CTRL+C]` and `[CTRL+V]`. When `[CTRL+C]` is encountered, the contents of the string before it should be 'copied' to a clipboard. Upon any instance of `[CTRL+V]` in the string, this clipboard should be pasted in its place. If `[CTRL+V]` is encountered before any corresponding `[CTRL+C]` then it should simply paste nothing.

### Example
For this example input:
```challenge("the first[CTRL+C] Coding Challenge was [CTRL+V] string manipulation task")```
Your solution might output:
```"the first Coding Challenge was the first string manipulation task"```

* [x] 5 points are awarded for a working algorithm as described above
* [x] 3 points are awarded for supporting `[CTRL+X]`, which should remove the preceding text before copying it to the clipboard
* [x] 2 points are awarded for validating your solution with a collection of unit tests

## Solution
In an attempt to actually get a few of these done: no more using random languages! For now, at least.

Run against a specific string using `cargo run "<string>"`, run unit tests using `cargo test`.
