defmodule Cadmus.Framework.Controller do
  defmacro __using__(_opts) do
    quote do
      import Cadmus.Framework.Controller
      import Cadmus.Conn

      ### Problem 2
      # The render function from before was very specific to the DogView.
      # Replace that code with code that is more generic. It is important to
      # understand what is happening, especially concerning `Module.concat\2`.
      def render(conn, template, assigns \\ []) do
        view_name =
          __MODULE__
          |> Atom.to_string()
          |> String.trim_trailing("Controller")
          |> Kernel.<>("View")
          |> String.to_atom()

        # view_module = Module.concat(Elixir, view_name)

        body = view_name.render(template, assigns) |> String.trim()
        put_resp_body(conn, body)
      end
    end
  end
end
