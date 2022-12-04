module Main exposing (..)

import Browser
import Browser.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)

type alias Ball =
    { x : Int
    , y : Int
    }

type alias Model =
    Ball


type Msg
    = OnAnimationFrame Float


type alias Flags = 
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { x = 250
      , y = 250
      }
    , Cmd.none
    )


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnAnimationFrame deltaTime ->
            ( {model | x = model.x + 4 }, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onAnimationFrameDelta OnAnimationFrame

view : Model -> Svg.Svg Msg
view model =
     svg [ width "500"
        , height "500"
        , viewBox "0 0 500 500"
        , Svg.Attributes.style "background: #efefef"
        ]
        [ viewBall model
        ]


viewBall : Ball -> Svg Msg 
viewBall { x, y } =
    circle 
        [ cx <| String.fromInt x
        , cy <| String.fromInt y
        , r "10"
        ]
        [] 