defmodule Cadmus.HelloController do
  import Cadmus.Conn

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> put_resp_body("<h1>Hello World!</h1>")
  end

end
