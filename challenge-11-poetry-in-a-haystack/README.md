# Challenge 10 - Poetry in a Haystack

## Problem
[Here is a file of complete gibb’rish](https://raw.githubusercontent.com/alexkitch/and-challenges/master/poetry.txt) - except all isn’t quite as t’would seemeth.
Buried amongst this nonsense art three lines of famous English poetry, and it’s thy task to write code which can locateth those lines.
You aren’t allowed to manually locate the lines and then simply write code to locate those specific lines, as that would obviously be cheating.

* [x] 6 points are awarded for locating the three lines of poetry
* [ ] 1 point is awarded for being able to do so in under 5 seconds
* [x] 3 points are awarded for being able to determine the author and title of the poem programatically

## Solution
Taking this as an NLP problem, I made it easy for myself by using python.
Using NTLK, I take each line, tokenise it, then use a corpus to determine what proportion of the line contains real words; the three with the highest "score" should be the poetry.

It was pretty easy to implement, but unfortunately it takes ~7.5 seconds to locate the poetry; however, I made this under the mistaken assumption that the lines would be from different poems.
As the lines appear to be from the same poem, I may be able to shortcut by simply taking the first line of poetry found, looking up the poem, then searching for the rest of the lines in the file.
