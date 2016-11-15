module Test.Runner.Html.App.Internal exposing (Model(..), Msg(..), SubUpdate)

import Random.Pcg as Random
import Time exposing (Time)
import Test exposing (Test)
import Expect exposing (Expectation)


type Msg subMsg
    = Init Time
    | SubMsg subMsg


type Model subMsg subModel
    = Uninitialized (SubUpdate subMsg subModel) (Maybe Random.Seed) Int Test (Time -> List (() -> ( List String, List Expectation )) -> ( subModel, Cmd subMsg ))
    | Initialized (SubUpdate subMsg subModel) subModel


type alias SubUpdate msg model =
    msg -> model -> ( model, Cmd msg )
