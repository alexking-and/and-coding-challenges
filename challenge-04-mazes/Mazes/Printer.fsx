module Printer =
  let print_solved_maze (maze: List<List<bool>>) (solution: List<List<bool>>) =
    for x = 0 to maze.Length - 1 do
      for y = 0 to maze.Head.Length - 1 do
        match maze[x][y] with
        | false -> "#"
        | true -> match solution[x][y] with
          | false -> " "
          | true -> "."
      printf "\n";;

  let print_maze (maze: List<List<bool>>) =
    print_solved_maze maze [ for i in 1 .. maze.Length -> [ for j in 1 .. maze.Head.Length -> false ] ];;
