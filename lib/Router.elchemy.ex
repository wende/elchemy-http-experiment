# Compiled using Elchemy v0.6.6
defmodule Router do
  use Elchemy

  alias Conn

  use Plug.Router
  import Plug.Router

  plug(:match)
  plug(:dispatch)

  def start_link do
    Plug.Adapters.Cowboy.http(Router, [])
  end

  match(_, do: run(conn.method, conn.path_info, conn))

  @spec run(String.t(), list(String.t()), Conn.conn()) :: Conn.conn()
  curry(run / 3)

  def run(method, path, conn) do
    case {method, path, conn} do
      {"GET", ["hello"], _} ->
        Conn.send_resp(200, "Hi there", conn)

      {_, _, _} ->
        Conn.send_resp(404, "Not found", conn)
    end
  end
end
