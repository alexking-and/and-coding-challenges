let wireColours: [String] = ["white", "orange", "black", "red", "green", "purple"]

func wireColoursWithout(without: [String]) -> [String] {
  return wireColours.filter { c in
    !without.contains(c)
  }
}

func cutWire(wire: String, prevWire: String?) -> Bool {
  switch prevWire {
    case nil:
      return true
    case "white":
      return wireColoursWithout(without: ["white", "black"]).contains(wire)
    case "orange":
      return ["green"].contains(wire)
    case "black":
      return wireColoursWithout(without: ["white", "green", "orange"]).contains(wire)
    case "red":
      return ["orange", "black"].contains(wire)
    case "green":
      return ["orange", "white"].contains(wire)
    case "purple":
      return wireColoursWithout(without: ["purple", "green", "orange", "white"]).contains(wire)
    default:
      return false
  }
}

func defuseBomb(wires: [String]) -> Bool {
  return wires.reduce((true, nil), { (acc: (Bool, String?), cur: String) in
    if !acc.0 {
      return acc
    } else if cutWire(wire: cur, prevWire: acc.1) {
      return (true, cur)
    } else {
      return (false, nil)
    }
  }).0
}

/*
 *  TESTS
 */

func test() -> Void {
  let testCases: [([String], Bool)] = [
    (["green", "white", "red", "black"], true),
    (["red", "green", "purple", "white"], false),
    (["white", "green", "black", "orange"], false),
    (["purple", "red", "orange", "green"], true),
    (["green", "black", "white", "orange"], false),
  ]

  testCases.forEach { (input: [String], expectedOutput: Bool) in
    if defuseBomb(wires: input) == expectedOutput {
      print(input.joined(separator: ", "), " -> PASS")
    } else {
      print(input.joined(separator: ", "), " -> FAIL")
    }
  }
}

test()
