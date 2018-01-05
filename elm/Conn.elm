module Conn exposing (sendResp, Conn)

import Elchemy exposing (..)


type alias Conn =
    {}


sendResp : Int -> String -> Conn -> Conn
sendResp int string conn =
    sendResp_ conn int string


sendResp_ : Conn -> Int -> String -> Conn
sendResp_ =
    ffi "Plug.Conn" "send_resp"
