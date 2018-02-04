defmodule Cadmus.DogController do
  # use Cadmus, :controller
  import Cadmus.Conn

  # Originally our index action looked like the following:
  # def index(conn, _params) do
  #   conn
  #   |> put_status(200)
  #   |> put_resp_body("<ul><li>mongo</li><li>chubbs</li></ul>")
  # end
  #
  # A controllers resposiblity is to marry data from the database with a view.
  # A views resonsibility to to display the data.
  #
  # Currently our controller is doing what the view should be doing. So the
  # code has been changed to be a better reflection of responsiblities. Also,
  # we have not covered databases at all so far, so for now we will pretend
  # that we are making reqeusts for data.
  #
  # NOTE: The contorllers reponsiblity of finding the data for the request also
  # includes protecting the data.  Protecting the data can include
  # authentication, authorization and parsing the request for data correctly
  # (pagination, etc..).
  def index(conn, _params) do
    dogs_from_imaginary_database = [%{name: "mongo"}, %{name: "chubbs"}]

    conn
    |> put_status(200)
    |> render("index.html", dogs: dogs_from_imaginary_database)
  end

  # And the refactor happens a second time for the `create` action.
  # def create(conn, %{name: name}) do
  #   conn
  #   |> put_status(201)
  #   |> put_resp_body("<ul><li>#{name}</li></ul>")
  # end
  def create(conn, %{name: name}) do
    # We normally would store the params from the router, fetch new data/state
    # and then pass the newly created data to the view. Since we don't have a
    # database we are simply going to imagine that
    # something awesome is happening.
    conn
    |> put_status(201)
    |> render("create.html", name: name)
  end

  ### Problem 1:
  # Move the folling function to `Cadmus.Framework.Controller`.
  # Use the new controller (uncomment line 3 and delete line 2)
  #
  # TODO: Don't forget to delete this function here when you are done.
  def render(conn, template, assigns) do
    body = Cadmus.DogView.render(template, assigns) |> String.trim()
    put_resp_body(conn, body)
  end
end
