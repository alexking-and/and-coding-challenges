// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
  Printer.print_maze (Generator.generate 10 10)
  0 // return an integer exit code
