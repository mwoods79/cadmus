defmodule Cadmus.Router do
  use Cadmus

  get "/hello" do
    conn
    |> put_status(200)
    |> put_resp_body("<h1>Hello World!</h1>")
  end

  get "/dogs" do
    conn
    |> put_status(200)
    |> put_resp_body("<ul><li>mongo</li><li>chubbs</li></ul>")
  end

  post "/dogs" do
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
