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
* [x] 3 points are awarded for an interactive user interface
* [x] 1 point is awarded for use of a unique coding language (used by no other participants)

## Solution
I picked Swift with the intention of compiling it to wasm and using regular HTML/CSS/JS, but turns out there's a library for building web apps directly in Swift, so that worked out.

Swift had some nice language features that made the logic really easy to write; SwiftUI, on the other hand, I'm sure would be nice after a lot more practice, but I ran into a bunch of problems which made it pretty frustrating to deal with, and it was surprisingly hard to find useful help online.

A demo is available at: https://alexking-and.github.io/defuser
