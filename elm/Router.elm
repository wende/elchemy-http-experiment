module Router exposing (..)

import Conn exposing (Conn)
import Elchemy.Macros exposing (..)
import Http


run : String -> List String -> Conn -> Conn
run method path conn =
    case ( method, path, conn ) of
        ( "GET", [ "hello" ], _ ) ->
            Conn.sendResp 200 "Hi there" conn

        ( _, _, _ ) ->
            Conn.sendResp 404 "Not found" conn


meta : List Macro
meta =
    [ Http.listen
    ]
