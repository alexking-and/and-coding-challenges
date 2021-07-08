module ClockParser exposing (timeStringToWordString)

-- Digits
digits: List String
digits = ["o'", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

digitToWord : Int -> Maybe String
digitToWord n = wordFromList n digits

-- Teens
teens: List String
teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

teenToWord : Int -> Maybe String
teenToWord n = wordFromList (n - 10) teens

-- Tens
tens: List String
tens = ["twenty", "thirty", "fourty", "fifty"]

tensToWord : Int -> Int -> Maybe String
tensToWord firstDigit secondDigit =
  case secondDigit of
    0 -> wordFromList (firstDigit - 2) tens
    _ ->
      case wordFromList (firstDigit - 2) tens of
        Nothing -> Nothing
        Just firstWord ->
          case wordFromList (secondDigit) digits of
            Nothing -> Nothing
            Just secondWord -> Just (String.concat [firstWord, " ", secondWord])

-- Other

hours : String -> Maybe Int
hours timeString =
  String.split ":" timeString
  |> List.head
  |> Maybe.andThen String.toInt

minutes : String -> Maybe Int
minutes timeString =
  String.split ":" timeString
  |> List.tail
  |> Maybe.andThen List.head
  |> Maybe.andThen String.toInt

amPm : Int -> String
amPm h = if (h < 12) then "am" else "pm"

intToNumberString : Int -> Maybe String
intToNumberString n =
  case n // 10 of
    0 -> digitToWord n
    1 -> teenToWord n
    2 -> tensToWord 2 (remainderBy 10 n)
    3 -> tensToWord 3 (remainderBy 10 n)
    4 -> tensToWord 4 (remainderBy 10 n)
    5 -> tensToWord 5 (remainderBy 10 n)
    _ -> Nothing

wordFromList : Int -> List String -> Maybe String
wordFromList n digitList =
  case digitList of
    [] -> Nothing
    (x::xs) ->
      case n of
        0 -> Just x
        _ -> wordFromList (n - 1) xs

-- Exposes
timeStringToWordString : String -> String
timeStringToWordString timeString = 
  case minutes timeString |> Maybe.andThen intToNumberString of
    Nothing -> "Invalid Input"
    Just m -> 
      case hours timeString of
        Nothing -> "Invalid Input"
        Just h ->
          case amPm h of
            "pm" -> 
              case intToNumberString (h - 12) of
                Nothing -> "Invalid Input"
                Just hx -> String.concat ["It's ", hx, " ", m, " p.m."]
            _ ->
              case intToNumberString h of
                Nothing -> "Invalid Input"
                Just hx -> String.concat ["It's ", hx, " ", m, " a.m."]
