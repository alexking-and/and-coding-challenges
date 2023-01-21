use regex::Regex;
use std::env;

fn process_text(text: &str) -> String {
    let re = Regex::new(r"\[CTRL\+[A-Z]\]").unwrap();
    let mut clipboard = String::new();
    let mut result = String::from(text);
    while re.is_match(&result) {
        match re
            .captures(&result)
            .unwrap()
            .get(0)
            .unwrap()
            .as_str()
            .chars()
            .nth(6)
            .unwrap()
        {
            'C' => {
                let current_string = result.clone();
                let (text_to_copy, remaining_text) = current_string.split_once("[CTRL+C]").unwrap();
                clipboard = text_to_copy.to_string();
                result = [text_to_copy, remaining_text].join("").to_string();
            },
            'X' => {
                let current_string = result.clone();
                let (text_to_copy, remaining_text) = current_string.split_once("[CTRL+X]").unwrap();
                clipboard = text_to_copy.to_string();
                result = remaining_text.to_string();
            },
            'V' => {
                let current_string = result.clone();
                let (previous_text, following_text) =
                    current_string.split_once("[CTRL+V]").unwrap();
                result = [
                    previous_text,
                    if clipboard.len() > 0 { &clipboard } else { "" },
                    following_text,
                ]
                .join("")
                .to_string();
            },
            _ => panic!("Unknown control character encountered"),
        }
    }

    result
}

fn main() {
    let args: Vec<String> = env::args().collect();
    match args.get(1) {
        Some(res) => println!("Result: {}", process_text(res)),
        None => {
            println!("Error: string to process must be included as the first command argument.")
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_copy_and_paste() {
        assert_eq!(
            process_text("the big red[CTRL+C] fox jumps over [CTRL+V] lazy dog."),
            "the big red fox jumps over the big red lazy dog."
        );
        assert_eq!(
            process_text("[CTRL+V]the tall oak tree towers over the lush green meadow."),
            "the tall oak tree towers over the lush green meadow."
        );
        assert_eq!(
            process_text("the sun shines down[CTRL+C] on [CTRL+V][CTRL+C] the busy [CTRL+V]."),
            "the sun shines down on the sun shines down the busy the sun shines down on the sun shines down."
        );
        assert_eq!(
            process_text("a majestic lion[CTRL+C] searches for [CTRL+V] in the tall grass."),
            "a majestic lion searches for a majestic lion in the tall grass."
        );
    }

    #[test]
    fn test_cut_and_paste() {
        assert_eq!(
            process_text(
                "the shimmering star[CTRL+X]Twinkling in the dark, [CTRL+V] shines bright."
            ),
            "Twinkling in the dark, the shimmering star shines bright."
        );
        assert_eq!(
            process_text(
                "[CTRL+X]a fluffy white cloud drifts [CTRL+V][CTRL+C] across the sky, [CTRL+V]"
            ),
            "a fluffy white cloud drifts  across the sky, a fluffy white cloud drifts "
        );
    }
}
