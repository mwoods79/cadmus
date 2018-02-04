defmodule Cadmus.Framework.Router do

  defmacro __using__(_opts) do
    quote do
      import Cadmus.Framework.Router
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
end
