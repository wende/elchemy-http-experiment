
# Compiled using Elchemy v0.7.1
defmodule Http do
  use Elchemy

  
  import Elchemy.Macros
  alias Conn

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

  defmacro listen(a1), do: Http.listen_macro(a1)

end


