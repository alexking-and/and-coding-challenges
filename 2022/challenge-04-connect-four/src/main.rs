use std::fmt;

#[derive(Debug, Clone)]
struct InvalidMoveError;

impl fmt::Display for InvalidMoveError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Invalid move")
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Player {
    Red,
    Yellow,
}

struct Move {
    col: usize,
    player: Player,
}

fn play_game(moves: &[Move]) -> Option<Player> {
    let mut board = [[None; 6]; 7];

    for m in moves {
        board = make_move(&board, m).unwrap_or(board);
        print_current_board(&board);

        match determine_winner_brute_force(&board) {
            Some(p) => return Some(p),
            None => (),
        };
    }

    None
}

fn determine_winner_brute_force(board: &[[Option<Player>; 6]; 7]) -> Option<Player> {
    fn f(acc: Option<Player>, cur: &Option<Player>) -> Option<Player> {
        if acc.is_some() && cur.is_some() && cur.unwrap() == acc.unwrap() {
            acc
        } else {
            None
        }
    }

    // vertical
    for col in board {
        for i in 0..3 {
            let res = col[i..(i + 4)].iter().fold(col[i], f);

            if res.is_some() {
                return res;
            }
        }
    }

    // horizontal
    for row_index in 0..6 {
        for left_col in 0..3 {
            let res = [
                board[left_col][row_index],
                board[left_col + 1][row_index],
                board[left_col + 2][row_index],
                board[left_col + 3][row_index],
            ]
            .iter()
            .fold(board[left_col][row_index], f);

            if res.is_some() {
                return res;
            }
        }
    }

    // diagonal
    for bottom in 0..3 {
        for left in 0..4 {
            let res = [
                board[left][bottom],
                board[left + 1][bottom + 1],
                board[left + 2][bottom + 2],
                board[left + 3][bottom + 3],
            ]
            .iter()
            .fold(board[left][bottom], f);

            if res.is_some() {
                return res;
            }
        }
    }

    for top in 3..6 {
        for left in 0..4 {
            let res = [
                board[left][top],
                board[left + 1][top - 1],
                board[left + 2][top - 2],
                board[left + 3][top - 3],
            ]
            .iter()
            .fold(board[top][left], f);

            if res.is_some() {
                return res;
            }
        }
    }

    None
}

fn make_move(
    board: &[[Option<Player>; 6]; 7],
    m: &Move,
) -> Result<[[Option<Player>; 6]; 7], InvalidMoveError> {
    if board[m.col]
        .iter()
        .filter(|i| i.is_some())
        .collect::<Vec<&Option<Player>>>()
        .len()
        == 6
    {
        return Err(InvalidMoveError);
    }

    let mut new_board: [[Option<Player>; 6]; 7] = [[None; 6]; 7];
    new_board.clone_from_slice(board);

    for i in 0..6 {
        if new_board[m.col][i].is_none() {
            new_board[m.col][i] = Some(m.player);
            break;
        }
    }

    Ok(new_board)
}

fn parse_move(s: &str) -> Move {
    let split: Vec<&str> = s.split("_").collect();
    Move {
        col: match split[0] {
            "A" => 0,
            "B" => 1,
            "C" => 2,
            "D" => 3,
            "E" => 4,
            "F" => 5,
            _ => 6,
        },
        player: match split[1] {
            "Red" => Player::Red,
            _ => Player::Yellow,
        },
    }
}

pub fn play_game_with_text_moves(moves: &[&str]) -> Option<Player> {
    let parsed_moves: Vec<Move> = moves.iter().map(|x| parse_move(*x)).collect();
    play_game(&parsed_moves)
}

fn print_winner(result: &Option<Player>) {
    let winner = match result {
        Some(r) => match r {
            Player::Red => "Red",
            Player::Yellow => "Yellow",
        },
        None => "No one",
    };

    println!("Result: {} wins!", winner);
}

fn print_current_board(board: &[[Option<Player>; 6]; 7]) {
    println!("---------------");
    for i in 0..6 {
        let row_string: String = board.iter().map(|col| {
            match col[5 - i] {
                Some(y) => match y {
                    Player::Red => "R|",
                    Player::Yellow => "Y|"
                },
                None => " |"
            }
        }).collect();
        println!("|{}", row_string);
        println!("---------------");
    }
    println!();
}

fn main() {
    let moves: Vec<Move> = vec![
        "A_Red", "B_Yellow", "A_Red", "B_Yellow", "A_Red", "B_Yellow", "G_Red", "B_Yellow",
    ]
    .iter()
    .map(|x| parse_move(*x))
    .collect();

    let result = play_game(&moves);
    print_winner(&result);
}

#[cfg(test)]
mod tests {
    use crate::Player;

    use super::play_game_with_text_moves;

    #[test]
    fn test_connect_four() {
        let cases = vec![
            (
                vec![
                    "A_Red", "B_Yellow", "A_Red", "B_Yellow", "A_Red", "B_Yellow", "G_Red",
                    "B_Yellow",
                ],
                Some(Player::Yellow),
            ),
            (
                vec![
                    "A_Red", "G_Yellow", "B_Red", "F_Yellow", "C_Red", "E_Yellow", "D_Red",
                ],
                Some(Player::Red),
            ),
            (
                vec![
                    "B_Yellow", "C_Red", "C_Yellow", "D_Red", "A_Yellow", "D_Red", "D_Yellow",
                    "E_Red", "E_Yellow", "F_Red", "E_Yellow",
                ],
                Some(Player::Red),
            ),
        ];

        for (input, expected_result) in cases {
            println!("{:?}", input);
            let actual_result = play_game_with_text_moves(&input);

            assert_eq!(actual_result, expected_result);
        }
    }
}
