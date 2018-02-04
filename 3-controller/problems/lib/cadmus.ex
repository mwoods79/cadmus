defmodule Cadmus do
  # Since we are going to be adding controllers to this file we start
  # cleaning up after ourselves.
  #
  # We can clean this up in two ways.
  # a. We can move this original code into a new file.
  #
  # b. Since everything is just a function, we can seperate the framework
  # portion of our applicaiton by using the `Cadmus.Framework` namespace.
  def router do
    quote do
      use Cadmus.Framework.Router
    end
  end

  # Now that we have a namespace we know exactly where to place the logic for
  # our controller.
  def controller do
    quote do
      use Cadmus.Framework.Controller
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
