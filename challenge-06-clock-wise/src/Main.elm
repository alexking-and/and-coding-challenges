module Main exposing (..)

import Browser
import Html exposing (Html, button, input, div, text)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value)
import ClockParser exposing (timeStringToWordString)

-- MAIN
main : Program () Model Msg
main = Browser.sandbox 
  {
    init = { userInput = "", displayText = "Initial Text" },
    update = update,
    view = view
  }

-- MODEL
type alias Model =
  {
    userInput: String,
    displayText: String
  }

-- UPDATE
type Msg = UpdateInput String | UpdateDisplay

update: Msg -> Model -> Model
update msg model =
  case msg of
    UpdateInput newInput -> { model | userInput = newInput }
    UpdateDisplay -> { model | displayText = timeStringToWordString model.userInput }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ 
      input [ value model.userInput, onInput UpdateInput ] [],
      button [ onClick UpdateDisplay ] [ text "Update" ],
      div [] [ text model.displayText ]
    ]
