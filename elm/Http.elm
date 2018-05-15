module Http exposing (listen)

import Elchemy.Macros exposing (..)
import Conn exposing (Conn)


{- ex
   def listen_macro(callback) do
       {m, f, []} = Macro.decompose_call(callback)
       quote do
           use Plug.Router
           import Plug.Router

           plug :match
           plug :dispatch

           def start_link do
               Plug.Adapters.Cowboy.http(Router, [])
           end

           match _ do
              conn = %Plug.Conn{method: method, path_info: path_info} = var!(conn)
              unquote(m).unquote(f)(method, path_info, conn)
            end
       end
   end
   def plug_macro(plug_name) do
       quote do
           plug unquote(String.to_atom(plug_name))
       end
   end
-}


listen : (String -> List String -> Conn -> Conn) -> Macro
listen =
    macro "Http" "listen_macro"
