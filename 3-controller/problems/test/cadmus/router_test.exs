defmodule Cadmus.RouterTest do
  use ExUnit.Case
  doctest Cadmus.Router

  ##
  # Helpers
  #
  def get(path) do
    conn = %Cadmus.Conn{
      method: "GET",
      path: path
    }

    Cadmus.Router.call(conn)
  end

  def post(path, params) do
    conn = %Cadmus.Conn{
      method: "POST",
      path: path,
      query_params: params
    }

    Cadmus.Router.call(conn)
  end

  ##
  # Tests
  #
  test "GET /hello" do
    response = get("/hello")
    assert response.status == 200
    assert response.resp_body == "<h1>Hello World!</h1>"
  end

  test "GET /dogs" do
    response = get("/dogs")
    assert response.status == 200
    assert response.resp_body == "<ul><li>mongo</li><li>chubbs</li></ul>"
  end

  test "POST /dogs => fido" do
    response = post("/dogs", %{name: "fido"})
    assert response.status == 201
    assert response.resp_body == "<ul><li>fido</li></ul>"
  end

  test "POST /dogs => coral" do
    response = post("/dogs", %{name: "coral"})
    assert response.status == 201
    assert response.resp_body == "<ul><li>coral</li></ul>"
  end

  test "404 error for anything else" do
    response = get("/nope")
    assert response.status == 404
    assert response.resp_body == "<h1>Not Found Error</h1>"
  end
end
