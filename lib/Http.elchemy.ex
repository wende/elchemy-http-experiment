
# Compiled using Elchemy v0.7.0-0
defmodule Http do
  use Elchemy

  
  import Elchemy.Macros

  def listen_macro do
      quote do
          use Plug.Router
          import Plug.Router

          plug :match
          plug :dispatch

          def start_link do
              Plug.Adapters.Cowboy.http(Router, [])
          end

          match _ do
            mod =
               __MODULE__
               |> Module.split
               |> Enum.drop(-1)
               |> Module.concat

             conn = %Plug.Conn{method: method, path_info: path_info} = var!(conn)
             mod.run(method, path_info, conn)
           end
      end
      |> IO.inspect(label: "listen")
  end
  def plug_macro(plug_name) do
      quote do
          plug unquote(String.to_atom(plug_name))
      end
  end

  defmacro listen(), do: Http.listen_macro()

end

