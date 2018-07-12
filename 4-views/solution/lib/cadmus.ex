defmodule Cadmus do
  def router do
    quote do
      use Cadmus.Framework.Router
    end
  end

  def controller do
    quote do
      use Cadmus.Framework.Controller
    end
  end

  def view do
    quote do
      use Cadmus.Framework.View, root: "lib/views"
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
