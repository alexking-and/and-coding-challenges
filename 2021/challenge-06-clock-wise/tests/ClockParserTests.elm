module ClockParserTests exposing (..)

import Expect
import Test exposing (..)
import ClockParser exposing (timeStringToWordString)

suite : Test
suite =
  describe "ClockParser"
    [
      describe "Examples"
        [
          test "Example 1" <|
            \_ ->
              let input = "16:22" in
              let expectedOutput = "It's four twenty two p.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 2" <|
            \_ ->
              let input = "20:01" in
              let expectedOutput = "It's eight o' one p.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 3" <|
            \_ ->
              let input = "19:18" in
              let expectedOutput = "It's seven eighteen p.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 4" <|
            \_ ->
              let input = "00:00" in
              let expectedOutput = "It's midnight" in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 5" <|
            \_ ->
              let input = "06:00" in
              let expectedOutput = "It's six a.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 6" <|
            \_ ->
              let input = "09:09" in
              let expectedOutput = "It's nine o' nine a.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 7" <|
            \_ ->
              let input = "12:00" in
              let expectedOutput = "It's midday" in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 8" <|
            \_ ->
              let input = "13:40" in
              let expectedOutput = "It's one forty p.m." in
              Expect.equal (timeStringToWordString input) expectedOutput,
          test "Example 9" <|
            \_ ->
              let input = "03:59" in
              let expectedOutput = "It's three fifty nine a.m." in
              Expect.equal (timeStringToWordString input) expectedOutput
        ]
    ]
