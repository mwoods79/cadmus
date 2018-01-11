defmodule Cadmus.RequestHandlerTest do
  use ExUnit.Case
  doctest Cadmus.RequestHandler

  test "handle" do
    request = """
    GET /hello HTTP/1.1\r
    Host: www.example.com\r
    \r
    """

    response = """
    HTTP/1.1 200 OK\r
    Content-Type: text/html\r
    Content-Length: 21\r
    \r
    <h1>Hello World!</h1>
    """

    assert Cadmus.RequestHandler.handle(request, Cadmus.Router) == response
  end

  test "parse" do
    request = """
    GET /hello HTTP/1.1\r
    Host: www.example.com\r
    \r
    """

    response = %Cadmus.Conn{
      method: "GET",
      path: "/hello",
      req_headers: %{"Host" => "www.example.com"}
    }

    assert Cadmus.RequestHandler.parse(request) == response
  end
end
