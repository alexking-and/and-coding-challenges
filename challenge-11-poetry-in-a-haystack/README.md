# Challenge 10 - Poetry in a Haystack

## Problem
[Here is a file of complete gibb’rish](https://raw.githubusercontent.com/alexkitch/and-challenges/master/poetry.txt) - except all isn’t quite as t’would seemeth. Buried amongst this nonsense art three lines of famous English poetry, and it’s thy task to write code which can locateth those lines. You aren’t allowed to manually locate the lines and then simply write code to locate those specific lines, as that would obviously be cheating.

* [x] 6 points are awarded for locating the three lines of poetry
* [ ] 1 point is awarded for being able to do so in under 5 seconds
* [ ] 3 points are awarded for being able to determine the author and title of the poem programatically

## Solution
Taking this as an NLP problem, I'll make it easy for myself by using Python. Should be easy to locate the lines of poetry, e.g. by scoring lines by number of valid english words they contain and picking the top three (although old english could potentially mess this up), then I'll need to find an API (or dataset) to determine the author and title.
