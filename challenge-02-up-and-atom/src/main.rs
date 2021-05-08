mod symbols;

use std::env;
use regex::Regex;

use symbols::{ELEMENTS, SUBSCRIPT_NUMBERS};

static BRACKET_GROUPS_MATCHER: &'static str = r"\((.+)\)([₂-₉]?)";
static SINGLE_SYMBOL_MATCHER: &'static str = r"([A-Z][a-z]?)([₂-₉]?)";

fn determine_quantity(match_string: &str) -> u8 {
  match match_string.len() {
    0 => 1,
    _ => *SUBSCRIPT_NUMBERS.get(match_string).unwrap()
  }
}

fn parse_formula(formula: &str) -> Vec<(String, u8)> {
  let mut element_counts: Vec<(String, u8)> = vec![];
  let bracket_groups_pattern = Regex::new(BRACKET_GROUPS_MATCHER).unwrap();
  let single_symbol_matcher = Regex::new(SINGLE_SYMBOL_MATCHER).unwrap();

  match bracket_groups_pattern.captures(formula) {
    None => {
      let caps = single_symbol_matcher.captures_iter(formula);
      for cap in caps {
        let symbol = cap.get(1).unwrap().as_str().to_string();
        let quantity = determine_quantity(cap.get(2).unwrap().as_str());
        element_counts.push((symbol, quantity));
      }
    },
    Some(caps) => {
      let inside_formula = caps.get(1).unwrap().as_str();
      let outside_formula = formula.replace(caps.get(0).unwrap().as_str(), "");
      let group_quantity = determine_quantity(caps.get(2).unwrap().as_str());

      let outside_result = parse_formula(&outside_formula);
      let inside_result: Vec<(String, u8)> = parse_formula(inside_formula)
        .iter()
        .map(|(symbol, quantity)| (symbol.clone(), quantity * group_quantity))
        .collect();

      outside_result.iter().for_each(|i| element_counts.push(i.clone()));
      inside_result.iter().for_each(|i| element_counts.push(i.clone()));
    }
  }

  element_counts
    .iter()
    .fold(vec![], |acc, cur| match acc.iter().find(|i| i.0 == cur.0) {
      None => {
        let mut new_acc = acc.clone();
        new_acc.push(cur.clone());
        new_acc
      },
      Some(_) => {
        let mut new_acc = acc.clone();
        new_acc.iter_mut().find(|i| i.0 == cur.0).unwrap().1 += cur.1;
        new_acc
      }
    })
}

fn pretty_print_result(formula_result: &[(String, u8)]) {
  formula_result
    .iter()
    .for_each(|i| println!("{}: {}", ELEMENTS.get(i.0.as_str()).unwrap_or(&i.0.as_str()), i.1));
}

fn main() {
  let args: Vec<String> = env::args().collect();
  match args.get(1) {
    None => pretty_print_result(&parse_formula("Co₃(Fe(CN)₆)₂")),
    Some(x) => pretty_print_result(&parse_formula(x.as_str()))
  }
}

#[cfg(test)]
mod tests {
  use super::parse_formula;

  #[test]
  fn test_parse_formula() {
    let cases = vec![
      ("KBrO₃", vec![("K".to_string(), 1), ("Br".to_string(), 1), ("O".to_string(), 3)]),
      ("H₂C(CH)CN", vec![("H".to_string(), 3), ("C".to_string(), 3), ("N".to_string(), 1)]),
      ("HfOH(C₂H₃O₂)₃", vec![("H".to_string(), 10), ("Hf".to_string(), 1), ("O".to_string(), 7), ("C".to_string(), 6)]),
      ("MnPb₈(Si₂O₇)₃", vec![("Mn".to_string(), 1), ("Pb".to_string(), 8), ("Si".to_string(), 6), ("O".to_string(), 21)]),
      ("Yb(ClO₄)₃", vec![("Yb".to_string(), 1), ("Cl".to_string(), 3), ("O".to_string(), 12)])
    ];

    for (input, expected_result) in cases {
      let actual_result = parse_formula(input);

      assert_eq!(actual_result.len(), expected_result.len());

      for pair in actual_result {
        assert!(expected_result.contains(&pair))
      }
    }
  }
}
