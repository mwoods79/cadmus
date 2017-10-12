defmodule Cadmus.Conn do
  @moduledoc """
  Documentation for Cadmus.
  """

  alias __MODULE__

  defstruct method:             "GET",
            path:               "",
            req_headers:        %{},
            query_params:       %{},
            status:             nil,
            resp_content_type:  "text/html",
            resp_body:          nil,
            resp_headers:       %{}

  @doc """
  Convience method to create a new Cadmus.Conn
  """
  def new() do
    %Cadmus.Conn{}
  end

  @doc """
  Sets the http response status

  ## Examples

      iex> Cadmus.Conn.put_status(Cadmus.Conn.new(), 200)
      %Cadmus.Conn{status: 200}

  """
  def put_status(%Conn{} = conn, status) do
    %{ conn | status: status }
  end

  @doc """
  Sets the http response body

  ## Examples

      iex> Cadmus.Conn.put_resp_body(Cadmus.Conn.new(), "<div>Hello!</div>")
      %Cadmus.Conn{resp_body: "<div>Hello!</div>"}

  """
  def put_resp_body(%Conn{} = conn, body) do
  end

  @doc """
  Sets the request method

  ## Examples

      iex> Cadmus.Conn.put_method(Cadmus.Conn.new(), "POST")
      %Cadmus.Conn{method: "POST"}

  """
  def put_method(%Conn{} = conn, method) do
  end

  @doc """
  Add a http response header

  ## Examples

      iex> conn = Cadmus.Conn.put_req_header(Cadmus.Conn.new(), "foo", "bar")
      %Cadmus.Conn{req_headers: %{"foo" => "bar"}}
      iex> Cadmus.Conn.put_req_header(conn, "qux", "que")
      %Cadmus.Conn{req_headers: %{"foo" => "bar", "qux" => "que"}}

  """
  def put_req_header(%Conn{} = conn, key, value) do
  end

  @doc """
  Sets the request path

  ## Examples

      iex> Cadmus.Conn.put_path(Cadmus.Conn.new(), "/path")
      %Cadmus.Conn{path: "/path"}

  """
  def put_path(%Conn{} = conn, path) do
  end

  @doc """
  Add a http response header

  ## Examples

      iex> conn = Cadmus.Conn.put_resp_header(Cadmus.Conn.new(), "foo", "bar")
      %Cadmus.Conn{resp_headers: %{"foo" => "bar"}}
      iex> Cadmus.Conn.put_resp_header(conn, "qux", "que")
      %Cadmus.Conn{resp_headers: %{"foo" => "bar", "qux" => "que"}}

  """
  def put_resp_header(%Conn{} = conn, key, value) do
  end
end
