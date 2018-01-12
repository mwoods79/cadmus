defmodule Cadmus do
  ## 3. Wouldn't it be nice to have a macro instead of all this boiler plate?
  #
  # The Phoenix Router API let's us write routing like this:
  #
  # use Cadmus, :router
  #
  # get "/hello", HelloController, :index
  # get "/dogs", DogController, :index
  # post "/dogs", DogController, :create
  #
  # It does some other fancy thing that we will ignore instead let's look at
  # how we might implement the above code.
  #
  # To help you along I have implemented the following macro.
  #
  # This macro is very similar to the macro in that plug uses in `Plug.Router`.
  #
  # Documentation here:
  #   https://github.com/elixir-plug/plug#the-plug-router
  #
  # Code here:
  #   https://github.com/elixir-plug/plug/blob/v1.4.3/lib/plug/router.ex#L202-L221
  #
  # a. Change `import Cadmus.Conn` to `use Cadmus` in `Cadmus.Router`.
  # b. Use the `get` and `post` macros in `Cadmus.Router`.
  defmacro __using__(_opts) do
    quote do
      import Cadmus
      import Cadmus.Conn

      def call(conn) do
        match(conn, conn.method, conn.path)
      end
    end
  end

  defmacro get(path, controller, action) do
    quote do
      def match(conn, "GET", unquote(path)) do
        apply(unquote(controller), unquote(action), [conn, conn.query_params])
      end
    end
  end

  defmacro post(path, controller, action) do
    quote do
      def match(conn, "POST", unquote(path)) do
        apply(unquote(controller), unquote(action), [conn, conn.query_params])
      end
    end
  end

  ## 4. Modify the above macro to take a controller and action.
  #
  # The `Kernal.apply/3` is used as follows:
  # `apply(module_name, function_name, list_of_arguments)`
  # `apply(DogController, :index, [params])`
  #
  # Documentation: https://hexdocs.pm/elixir/Kernel.html#apply/3
  #
  # Modify the router to use the new macro!
  #
  ## 5. Bonus!
  # modify `use Cadmus` in the router to `use Cadmus, :router`
  # remember the __using__/1 macro takes options, use this do decide what to
  # import.
end
