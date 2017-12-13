defmodule Cadmus.Router do
  # 1. Change this to an import. This will allow the use of `Cadmus.Conn`
  # functions without needing to namespace.
  alias Cadmus.Conn

  def call(conn) do
    conn
    |> Conn.put_status(200)
    |> Conn.put_resp_body("<h1>Hello World!</h1>")
  end

  ## 1. Use the function below in the call method.
  def match(conn, "GET", "/hello") do
    # conn
    # |> put_status(200)
    # |> put_resp_body("<h1>Hello World!</h1>")
  end

  ## 2. Continue to use pattern matching until all the tests pass
  def match(conn, "GET", "/dogs") do
  end
end
