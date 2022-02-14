port module Main exposing (..)

import Browser
import Html exposing (Html, button, input, div, text, h1)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value, class)
import ClockParser exposing (timeStringToWordString)

-- MAIN
main : Program () Model Msg
main = Browser.element 
  {
    init = init,
    update = update,
    view = view,
    subscriptions = subscriptions
  }

-- PORTS
port speak : String -> Cmd msg

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none

-- MODEL
type alias Model =
  {
    userInput: String,
    displayText: String
  }

-- INIT
init : flags -> (Model, Cmd Msg)
init _ = ({ userInput = "", displayText = "Initial Text" }, Cmd.none)

-- UPDATE
type Msg = UpdateInput String | UpdateDisplay | Speak

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UpdateInput newInput -> ({ model | userInput = newInput }, Cmd.none)
    UpdateDisplay -> ({ model | displayText = timeStringToWordString model.userInput }, Cmd.none)
    Speak -> (model, speak model.displayText)

-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ 
      h1 [ class "display" ] [ text model.displayText ],
      input [ value model.userInput, onInput UpdateInput ] [],
      div []
        [
          button [ onClick UpdateDisplay ] [ text "Update" ],
          button [ onClick Speak ] [ text "Speak" ]
        ]
    ]
