import TokamakShim

struct WireButtonStyle: ButtonStyle {
  let cut: Bool
  let colour: String

  var colourObj: Color {
    switch colour {
      case "orange": return Color.orange
      case "black": return Color.black
      case "red": return Color.red
      case "green": return Color.green
      case "purple": return Color.purple
      default: return Color.white
    }
  }

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .frame(width: 400, height: 20)
      .background(
        Rectangle()
          .fill(cut ? Color.clear : colourObj)
          .frame(width: 400, height: 20)
      )
  }
}

struct Bomb: View {
  @State var cutSequence: [String] = []
  @State var exploded: Bool = false
  @State var defused: Bool = false

  func cutWire(wire: String) -> Void {
    cutSequence = cutSequence + [wire]
    exploded = !defuseBomb(wires: cutSequence)
    defused = !exploded && cutSequence.count >= 4
    print("current cut sequence:", cutSequence.joined(separator: ","))
  }

  func resetBomb() -> Void {
    cutSequence = []
    exploded = false
    defused = false
    print("bomb reset")
  }

  var body: some View {
    VStack {
      Text("Exploded: \(exploded ? "Yes" : "No")")
      Text("Defused: \(defused ? "Yes" : "No")")
      Button("") { cutWire(wire: "white") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("white"), colour: "white"))
      Button("") { cutWire(wire: "orange") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("orange"), colour: "orange"))
      Button("") { cutWire(wire: "black") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("black"), colour: "black"))
      Button("") { cutWire(wire: "red") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("red"), colour: "red"))
      Button("") { cutWire(wire: "green") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("green"), colour: "green"))
      Button("") { cutWire(wire: "purple") }.buttonStyle(WireButtonStyle(cut: cutSequence.contains("purple"), colour: "purple"))
      Button("reset") { resetBomb() }
    }
  }
}

struct DefuserApp: App {
  var body: some Scene {
    WindowGroup("Defuser") {
      Bomb()
    }
  }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
DefuserApp.main()
