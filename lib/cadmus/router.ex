defmodule Cadmus.Router do
  alias Cadmus.Conn
  def call(conn) do
    conn
    |> Conn.put_status(200)
    |> Conn.put_resp_body("<h1>Hello World!</h1>")
  end
end
