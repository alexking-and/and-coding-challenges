# Challenge 2 - Up and Atom!

## Problem
A chemical formula is a way of presenting information about the proportions of atoms that make up a compound.
They're written as a sequence of elements followed by numbers denoting the amount of atoms of each element.
Elements are represented as an uppercase letter, sometimes followed by a lowercase letter (for example: `Fe` and `C`).
Your task is to write a tool capable of determining how many atoms of each element are present in a given formula.
Chemical formulae can be fairly complicated, but your tool should at least support the use of parentheses to group together elements - remember to multiply the elements inside the parentheses by the number which follows them.

* 5 points are awarded for submitting a working solution which can parse [this set of sample formulae](https://pastebin.com/cFJJnR0T)
* 3 further points are awarded for a solution capable of parsing `Co₃(Fe(CN)₆)₂`
* 2 further points are awarded for a solution which can present its results using the proper names of the elements (e.g. `Fe` as `Iron`)

### Example
For the following chemical formula
```
CH₂(OH)₂
```
The expected output would be something like:
```
C: 1
H: 4
O: 2
```

## Solution
I try not to use any languages I've used before, but *technically*, since this is a rebooted series, I have an opportunity to use Rust again!
