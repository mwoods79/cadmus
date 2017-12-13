defmodule Cadmus.Router do
  # 0. Optionally you can change this to an import. This will allow the use of
  # Cadmus.Conn functions without needing to namespace.
  import Cadmus.Conn

  def call(conn) do
    conn
    |> put_status(200)
    |> put_resp_body("<h1>Hello World!</h1>")
    match(conn, conn.method, conn.path)
  end

  ## 1. Use the function below in the call method.
  def match(conn, "GET", "/hello") do
    conn
    |> put_status(200)
    |> put_resp_body("<h1>Hello World!</h1>")
  end

  ## 2. Continue to use pattern matching until all the tests pass
  def match(conn, "GET", "/dogs") do
    conn
    |> put_status(200)
    |> put_resp_body("<ul><li>mongo</li><li>chubbs</li></ul>")
  end

  def match(conn, "POST", "/dogs") do
    conn
    |> put_status(201)
    |> put_resp_body("<ul><li>#{conn.query_params[:name]}</li></ul>")
  end

  def match(conn, _method, _path) do
    conn
    |> put_status(404)
    |> put_resp_body("<h1>Not Found Error</h1>")
  end
end
