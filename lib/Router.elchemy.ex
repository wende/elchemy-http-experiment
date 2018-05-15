
# Compiled using Elchemy v0.7.0-0
defmodule Router do
  use Elchemy

  
  alias Conn
  import Elchemy.Macros
  alias Http
  @spec run(String.t, list(String.t), Conn.conn) :: Conn.conn
  curry run/3
  def run(method, path, conn) do
    case {method, path, conn} do
      {"GET", ["hello"], _} ->
        Conn.send_resp(200, "Hi there", conn)
      {_, _, _} ->
        Conn.send_resp(404, "Not found", conn)
    end
  end

end
defmodule Router.Meta do
  require Http

  [Http.listen]
end
