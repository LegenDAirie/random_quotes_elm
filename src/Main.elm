import Html exposing (Html, text, div, button)
import Html.App as App
import Http
import Json.Decode as Json
import Task

main =
  App.program
    { view = view
    , update = update
    , init = init
    , subscriptions = subscriptions
    }

type alias Model =
  { quote: String
  , person: String
  }

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

init : (Model, Cmd Msg)
init =
  ( Model "cats" "dogs"
  , Cmd.none
  )

type Msg
  = MorePlz
  | FetchSucceeded String
  | FetchFailed Http.Error


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlz ->
      (model, Cmd.none)

    FetchSucceeded quote ->
      model

    FetchFailed error ->
      model



view : Model -> Html Msg
view model =
  div []
    [ text model.quote
    , button [] [ text "Tweet this awesome quote" ]
    , text model.person
    , button [] [ text "more quotes plz" ]
    ]
