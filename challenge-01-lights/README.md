# Challenge 10 - Lights!

## Problem
The clubhouse has been understandably pretty quiet of late, but at last, life is slowly returning and the office is alive once again with the sound of busy ANDis.
There's a smart-lamp in the corner of the room which is only turned on when somebody is in the room.
Given a set of intervals which describe the entrance and exit times of ANDi's in minutes, your task is to write code to determine how many minutes the light has been on for in total.
The input data is provided [here](https://pastebin.com/erXaH6G9).

* 3 points are awarded for submitting a working solution
* 3 further points are awarded for using a language/framework which no other participants use
* 4 further points are awarded for a solution under 400 bytes of code

### Example
For the following set of intervals:
```
[2,5]
[4,8]
[10,13]
```
The expected output is: `9`

## Solution
I've been building up a list of weird languages to try (including a couple I absolutely can't wait to use, but I'm gonna need a *really* specific challenge to make them work) so I'm glad these are back!
Starting this one with Lua, a language I haven't touched outside of a Minecraft mod I used to play around with like 8 years ago.

Lua is *very* lightweight when it comes to what's in the standard library, but it was surprisingly nice to work with, and this challenge was simple enough that it went very smoothly.
Fortunately, turns out it is also very crushable, so I had plenty of room to fit it into 400 bytes while still keeping a lot of the formatting in place!
