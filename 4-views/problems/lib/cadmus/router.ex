defmodule Cadmus.Router do
  use Cadmus, :router
  alias Cadmus.DogController
  alias Cadmus.HelloController

  get("/hello", HelloController, :index)
  get("/dogs", DogController, :index)
  post("/dogs", DogController, :create)

  def match(conn, _method, _path) do
    conn
    |> put_status(404)
    |> put_resp_body("<h1>Not Found Error</h1>")
  end
end
