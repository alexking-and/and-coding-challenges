# Challenge 12 - Number Rendering

## Problem
Given any whole integer number, your task this week is simply to output the number to the console in the traditional LCD “calculator font”.
You shouldn’t use any external libraries to achieve this.

* [x] 7 points are awarded for a working solution
* [x] 3 points are awarded for a solution in under 50 lines of code

## Solution
This one was very straight forward: have a pre-defined conversion from digits to 2D char arrays, map the input to those arrays, manipulate arrays so the top line of each digit is printed on a single line (and so on), then done!

Run with `ruby render_number.rb [input]`
