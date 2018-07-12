defmodule Cadmus.Framework.Controller do
  defmacro __using__(_opts) do
    quote do
      import Cadmus.Framework.Controller
      import Cadmus.Conn

      def render(conn, template, assigns \\ []) do
        view_name =
          __MODULE__
          |> Atom.to_string()
          |> String.trim_trailing("Controller")
          |> Kernel.<>("View")
          |> String.to_atom()

        body = view_name.render(template, assigns) |> String.trim()
        put_resp_body(conn, body)
      end
    end
  end
end
