defmodule Cadmus.RequestHandler do
  alias Cadmus.Conn

  def handle(request, router) do
    request
    |> parse
    |> router.call
    |> reply
  end

  def parse(request) do
    # returns two strings in a list, the top and body
    [top, body] = String.split(request, "\r\n\r\n")

    # returns a list of all lines in top (headers)
    # the first line needs to be processed differently
    [request_line | headers] = String.split(top, "\r\n")

    # request_line = "GET /hello HTTP1.1"
    [method, path, _http] = String.split(request_line, " ")

    %Cadmus.Conn{method: method, path: path}
    |> parse_headers(headers)
    |> parse_params(body)
  end

  @doc """
  Parses headers from request `Accept: application/json`
  into a map with corresponding keys and values.

  ## Examples
      iex> headers = ["Accept: application/json", "X-Foo: bar"]
      iex> conn = Cadmus.Conn.new
      iex> conn = Cadmus.RequestHandler.parse_headers(conn, headers)
      iex> conn.req_headers
      %{"Accept" => "application/json", "X-Foo" => "bar"}
  """
  def parse_headers(%Conn{} = conn, [head | tail]) do
    [key, value] = String.split(head, ": ")

    conn
    |> Conn.put_req_header(key, value)
    |> parse_headers(tail)
  end

  def parse_headers(%Conn{} = conn, []), do: conn

  @doc """
  Parses the given param string of the form `key1=value1&key2=value2`
  into a map with corresponding keys and values.

  ## Examples
      iex> params_string = "key1=value1&key2=value2"
      iex> conn = %Cadmus.Conn{req_headers: %{"Content-Type" => "application/x-www-form-urlencoded"}}
      iex> conn = Cadmus.RequestHandler.parse_params(conn, params_string)
      iex> conn.query_params
      %{"key1" => "value1", "key2" => "value2"}
      iex> conn = %Cadmus.Conn{req_headers: %{"Content-Type" => "other"}}
      iex> conn = Cadmus.RequestHandler.parse_params(conn, "whatever")
      iex> conn.query_params
      %{}
  """
  def parse_params(%Conn{} = conn, params_string) do
    parse_params(conn, conn.req_headers["Content-Type"], params_string)
  end

  def parse_params(%Conn{} = conn, "application/x-www-form-urlencoded", params_string) do
    query_params = params_string |> URI.decode_query()
    %{conn | query_params: query_params}
  end

  def parse_params(%Conn{} = conn, _content_type, _params_string), do: conn

  def reply(%Conn{} = conn) do
    """
    HTTP/1.1 #{conn.status} #{status_as_word(conn)}\r
    Content-Type: #{conn.resp_content_type}\r
    Content-Length: #{String.length(conn.resp_body)}\r
    \r
    #{conn.resp_body}
    """
  end

  def status_as_word(%Conn{status: status}) do
    %{
      200 => "OK",
      404 => "Not Found"
    }[status]
  end
end
