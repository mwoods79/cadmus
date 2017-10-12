defmodule Cadmus.RequestHandler do

  alias Cadmus.Conn

  def handle(request, router) do
    request
    |> parse
    |> router.call
    |> reply
  end

  def parse(request) do
  end

  @doc """
  Parses headers from request `Accept: application/json`
  into a map with corresponding keys and values.

  ## Examples
      iex> headers = ["Accept: application/json", "X-Foo: bar"]
      iex> conn = Cadmus.Conn.new
      iex> Cadmus.RequestHandler.parse_params(conn, headers)
      %{req_headers: ["Accept" => "application/json", "X-Foo" => "bar"]}
  """
  def parse_headers(%Conn{} = conn, [head | tail]) do
  end

  def parse_headers(%Conn{} = conn, []), do: conn

  @doc """
  Parses the given param string of the form `key1=value1&key2=value2`
  into a map with corresponding keys and values.

  ## Examples
      iex> params_string = "key1=value1&key2=value2"
      iex> conn = %Cadmus.Conn{req_headers: %{"Content-Type" => "application/x-www-form-urlencoded"}
      iex> Cadmus.RequestHandler.parse_params(conn, params_string)
      %{"key1" => "value", "key2" => "value2"}
      iex> conn = %Cadmus.Conn{req_headers: %{"Content-Type" => "other"}
      iex> Servy.Parser.parse_params(conn, not_processed = "")
      %{}
  """
  def parse_params(%Conn{} = conn, params_string) do
  end

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
