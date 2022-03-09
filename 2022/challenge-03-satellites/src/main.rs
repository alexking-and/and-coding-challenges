fn will_collide(satellites: &[i8]) -> bool {
    match satellites.iter().find(|x| x < &&0) {
        None => false,
        Some(_) => {
            satellites
                .iter()
                .fold((false, false), |(proven_collide, seen_positive), cur| {
                    if proven_collide || (seen_positive && (cur < &0)) {
                        (true, false)
                    } else if cur > &0 {
                        (false, true)
                    } else {
                        (false, false)
                    }
                })
                .0
        }
    }
}

fn process_collisions(satellites: &[i8]) -> Vec<i8> {
    satellites
        .iter()
        .fold((vec![], 0), |(acc, prev): (Vec<i8>, i8), cur: &i8| {
            if cur < &prev {
                if i8::abs(*cur) > i8::abs(prev) {
                    ([acc, vec![*cur]].concat(), 0)
                } else if i8::abs(prev) > i8::abs(*cur) {
                    ([acc, vec![prev]].concat(), 0)
                } else {
                    (acc, 0)
                }
            } else {
                (acc, *cur)
            }
        })
        .0
}

fn collide(initial_satellites: Vec<i8>) -> Vec<i8> {
    let mut satellites = initial_satellites.clone();
    while will_collide(&satellites) {
        satellites = process_collisions(&satellites);
    }

    satellites
}

fn main() {
    println!(
        "Sample 1 result: {:?}",
        collide(vec![-4, 2, -3, 3, 4, -1, 2, -2, 3, -4])
    );
    println!(
        "Sample 2 result: {:?}",
        collide(vec![5, -2, -5, -2, 3, -1, -1, 3, -4])
    );
    println!(
        "Sample 3 result: {:?}",
        collide(vec![1, -1, 1, 1, -1, -1, 1, -1])
    );
}

#[cfg(test)]
mod tests {
    use super::collide;

    #[test]
    fn test_collide() {
        let cases = vec![
            (vec![-3, 1, 1, -2, 3, -2], vec![-3, -2, 3]),
            (vec![-2, -1, 1, 2], vec![-2, -1, 1, 2]),
            (vec![-2, 1, 1, -2], vec![-2, -2]),
            (vec![1, 1, -2, -2], vec![-2, -2]),
            (vec![10, 2, -5], vec![10]),
            (vec![8, -8], vec![]),
        ];

        for (input, expected_result) in cases {
            let actual_result = collide(input);

            assert_eq!(actual_result.len(), expected_result.len());
            assert_eq!(actual_result, expected_result);
        }
    }
}
