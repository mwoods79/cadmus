defmodule Cadmus.DogController do
  use Cadmus, :controller

  def index(conn, _params) do
    dogs_from_imaginary_database = [%{name: "mongo"}, %{name: "chubbs"}]

    conn
    |> put_status(200)
    |> render("index.html", dogs: dogs_from_imaginary_database)
  end

  def create(conn, %{name: name}) do
    conn
    |> put_status(201)
    |> render("create.html", name: name)
  end
end
