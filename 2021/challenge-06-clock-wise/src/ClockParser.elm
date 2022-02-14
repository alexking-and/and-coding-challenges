module ClockParser exposing (timeStringToWordString)

-- Helpers
wordFromList : Int -> List String -> Maybe String
wordFromList n digitList =
  case digitList of
    [] -> Nothing
    (x::xs) ->
      case n of
        0 -> Just x
        _ -> wordFromList (n - 1) xs

-- Digits
digits: List String
digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

digitToWord : Int -> Maybe String
digitToWord n = wordFromList n digits

-- Teens
teens: List String
teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

teenToWord : Int -> Maybe String
teenToWord n = wordFromList (n - 10) teens

-- Tens
tens: List String
tens = ["twenty", "thirty", "forty", "fifty"]

tensToWord : Int -> Int -> Maybe String
tensToWord firstDigit secondDigit =
  let firstDigitWord = wordFromList (firstDigit - 2) tens in
  let secondDigitWord = wordFromList secondDigit digits in
  case (firstDigitWord, secondDigitWord) of
    (Just a, Just "") -> Just a
    (Just a, Just b) -> Just (String.concat [a, " ", b])
    _ -> Nothing

-- Hours
hours : String -> Maybe Int
hours timeString =
  String.split ":" timeString
  |> List.head
  |> Maybe.andThen String.toInt

intToHourString : Int -> Maybe String
intToHourString n =
  let twelveHrVal = if n > 12 then n - 12 else n in
  case twelveHrVal // 10 of
    0 -> digitToWord twelveHrVal
    1 -> teenToWord twelveHrVal
    _ -> Nothing

amPm : Int -> String
amPm h = if (h < 12) then "a.m." else "p.m."

-- Minutes
minutes : String -> Maybe Int
minutes timeString =
  String.split ":" timeString
  |> List.tail
  |> Maybe.andThen List.head
  |> Maybe.andThen String.toInt

intToMinuteString : Int -> Maybe String
intToMinuteString n =
  let f x = Just (String.concat ["o' ", x]) in
  case n // 10 of
    0 -> Maybe.andThen f (digitToWord n)
    1 -> teenToWord n
    2 -> tensToWord 2 (remainderBy 10 n)
    3 -> tensToWord 3 (remainderBy 10 n)
    4 -> tensToWord 4 (remainderBy 10 n)
    5 -> tensToWord 5 (remainderBy 10 n)
    _ -> Nothing

-- Exposes
timeStringToWordString : String -> String
timeStringToWordString timeString =
  case timeString of
    "00:00" -> "It's midnight"
    "12:00" -> "It's midday"
    _ ->
      let minutesVal = minutes timeString in
      let hoursVal = hours timeString in
      let amPmStr = amPm (Maybe.withDefault 0 hoursVal) in
      let minutesStr = Maybe.andThen intToMinuteString minutesVal in
      let hoursStr = Maybe.andThen intToHourString hoursVal in
      case (minutesStr, hoursStr) of
        (Just m, Just h) -> 
          if minutesVal == Just 0
          then String.concat ["It's ", h, " ", amPmStr]
          else String.concat ["It's ", h, " ", m, " ", amPmStr]
        _ -> "Invalid Input"
