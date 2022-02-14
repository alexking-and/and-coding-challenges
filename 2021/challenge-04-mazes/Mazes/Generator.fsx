module Generator =
  let generate (height: int) (width: int) : List<List<bool>> =
    type Direction = Up | Right | Down | Left;;

    let initialise_maze (height: int) (width: int) : List<List<bool>> =
      [ for _ in 1..width -> [ for _ in 1..height -> false ] ];;

    let is_next_cell_empty (maze: List<List<bool>>) (dimensions: int * int) ((pos_x, pos_y): int * int) (dir: Direction) =

      let is_pos_in_bounds ((width, height): int * int) ((pos_x, pos_y): int * int) =
        pos_x > 0 && pos_x <= width && pos_y > 0 && pos_y <= height;;

      match dir with
      | Up -> is_pos_in_bounds dimensions (pos_x, pos_y - 2) && maze.Item(pos_x).Item(pos_y - 2)
      | Right -> is_pos_in_bounds dimensions (pos_x + 2, pos_y) && maze.Item(pos_x + 2).Item(pos_y)
      | Down -> is_pos_in_bounds dimensions (pos_x, pos_y + 2) && maze.Item(pos_x).Item(pos_y + 2)
      | Left -> is_pos_in_bounds dimensions (pos_x - 2, pos_y) && maze.Item(pos_x - 2).Item(pos_y);;

    let rec carve_path (maze: List<List<bool>) ((pos_x, pos_y): int * int) (junction_stack: List<(j_pos, dirs_explored): ((int * int) * int)>) = ()

    initialise_maze height width;;
