# Challenge 7 - Coding's a Blast

## Problem
In order to disarm a bomb, there are a few wires which need to be carefully cut.
There are 6 different colours of wire and each colour has a unique rule concerning which other colour wires should be cut:
```
If you cut a white wire, you can't then cut white or black wire.
If you cut an orange wire, you have to then cut a green one.
If you cut a black wire, you aren't allowed to then cut a white, green or orange one.
If you cut a red wire, you must then cut an orange or black one.
If you cut a green wire, you must then cut an orange or white one.
If you cut a purple wire, you can't then cut a purple, green, orange or white one.
```

Your challenge is to create an algorithm which, given [some sequences of wire cuts](https://pastebin.com/KcZzndyq), can determine whether or not the bomb was successfully disarmed in each case.

* [x] 6 points are awarded for a working algorithm using the given sequences
* [ ] 3 points are awarded for an interactive user interface
* [?] 1 point is awarded for use of a unique coding language (used by no other participants)

## Solution
For the UI I'd like to use web, so probably something LLVM-compatible for the main code. Thinking either Swift, Ruby, or Scala. (probably Swift)
