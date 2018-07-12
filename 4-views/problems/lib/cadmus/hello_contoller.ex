defmodule Cadmus.HelloController do
  use Cadmus, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> render("index.html")
  end
end
