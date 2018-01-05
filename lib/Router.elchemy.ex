
# Compiled using Elchemy v0.5.4
defmodule Router do
  use Elchemy

  
  alias Conn

  use Plug.Router
  import Plug.Router

  plug :match
  plug :dispatch

  match _, do: run(conn.params["path"], "GET", conn)


  @spec run(String.t, list(String.t), Conn.conn) :: Conn.conn
  curry run/3
  def run("GET" = method, ["hello"] = path, _ = conn) do
    Conn.send_resp(200, "Hi there", conn)
  end
  def run(_ = method, _ = path, _ = conn) do
    Conn.send_resp(404, "Not found", conn)
  end

end

