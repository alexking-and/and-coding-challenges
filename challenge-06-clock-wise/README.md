# Challenge 6 - Clock Wise

## Problem
Your challenge this week is to build a speaking clock.
Given [this sample set](https://pastebin.com/49NFNXr1) of 24-hour times, your clock should output a readable, English string representation of the time in 12-hour format.

* [x] 5 points are awarded for a working solution
* [x] 4 points are awarded for a solution which can output results with audio
* [x] 1 point is awarded for providing a suite of unit tests

### Example
Given the following inputs:

`14:05`

`17:45`

Your clock might output:

`It's two o' five pm`

`It's five forty five pm`

## Solution
Elm is a functional language that compiles to JS I wasn't aware of until recently, but I wanted something that could run on the web so I could utilise the SpeechSynthesis web API and Elm seemed like an interesting choice.
Can't say I expect to be using this in place of JS for the web in the future, but it was surprisingly nice to work with! and definitely seems like an easy way to work in a pure functional paradigm on the web.

A demo is available at https://alexking-and.github.io/speaking-clock/
