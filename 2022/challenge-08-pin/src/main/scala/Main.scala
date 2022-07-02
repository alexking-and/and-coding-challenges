val adjacencies = List(
  List('8'),
  List('2', '4'),
  List('1', '3', '5'),
  List('2', '6'),
  List('1', '5', '7'),
  List('2', '4', '6', '8'),
  List('3', '5', '9'),
  List('4', '8'),
  List('0', '5', '7', '8'),
  List('6', '8')
)

val keywear = List('5', '1', '2', '8', '7', '4', '0', '3', '6', '9')

def likelihood(input: String, combination: String): List[String] = {
  return List()
}

def combinationsRec(buttonPossibilities: List[List[Char]]): List[Char] = buttonPossibilities match {
  case Nil => List()
  case x :: xs => x.flatMap(y => List(List(y), combinationsRec(xs)))
}

def combinations(input: String): List[String] = {
  val x = input.toCharArray().map(_.asDigit).collect[Vector[Int]](y => y)
  return combinationsRec(x).map(combo => combo.toString())
}

@main def hello: Unit = 
  println(combinations("46"))
