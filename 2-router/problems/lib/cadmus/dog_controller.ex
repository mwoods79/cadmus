defmodule Cadmus.DogController do
  import Cadmus.Conn

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> put_resp_body("<ul><li>mongo</li><li>chubbs</li></ul>")
  end

  def create(conn, %{name: name}) do
    conn
    |> put_status(201)
    |> put_resp_body("<ul><li>#{name}</li></ul>")
  end
end
