# Challenge 4 - Mazes

## Problem
This week’s challenge is to build an application capable of generating random mazes to a given specification.
Given a target width and height, your algorithm should be capable of outputting a unique, solvable maze.
:six:  Points are awarded for generating valid, solvable mazes
:three:  Further points are awarded for a solution which can visualise the most optimal route to solve the maze
:one:  Further point is awarded for a non-JavaScript solution

* [ ] 6 points are awarded for generating valid, solvable mazes
* [ ] 3 points are awarded for a solution which can visualise the most optimal route to solve the maze
* [ ] 1 further point is awarded for a non-JavaScript solution

### Additional Info
You’re free to decide on a suitable start and end location for each maze.
You can also assume a minimum width and height of 10 units.
Maze walls should be 1 unit in thickness.
Mazes don’t necessarily have to be square.

## Solution
I haven't tried maze generation before but I _think_ I can make one with a fairly simple recursive algorithm, which should then just need a tree traversal algorithm to solve, so I think this should be simple enough that I can whip out a pure functional language for this (thinking either Reason or F#).
