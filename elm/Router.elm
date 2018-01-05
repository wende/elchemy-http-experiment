module Router exposing (..)

import Conn exposing (Conn)


{- ex
   use Plug.Router
   import Plug.Router

   plug :match
   plug :dispatch

   match _, do: run(conn.params["path"], "GET", conn)

-}


run : String -> List String -> Conn -> Conn
run method path conn =
    case ( method, path, conn ) of
        ( "GET", [ "hello" ], _ ) ->
            Conn.sendResp 200 "Hi there" conn

        ( _, _, _ ) ->
            Conn.sendResp 404 "Not found" cnn
