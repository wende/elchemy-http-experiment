
# Compiled using Elchemy v0.5.4
defmodule Plug do
  use Elchemy

  
  @type conn :: %{
    
  }

  @spec send_resp(integer, String.t, conn) :: conn
  curry send_resp/3
  def send_resp(int, string, conn) do
    send_resp_(conn, int, string)
  end

  @spec send_resp_(conn, integer, String.t) :: conn
  curry send_resp_/3
  verify as: Plug.Conn.send_resp/3
  defp send_resp_(a1, a2, a3), do: Plug.Conn.send_resp(a1, a2, a3)
end

