defmodule Cadmus.Framework.View do
  defmacro __using__(opts) do
    path = Keyword.fetch!(opts, :root)
    for template <- Path.wildcard(path <> "/*.eex") do
      base_path = Path.basename(template, ".eex")
      template_content = File.read!(template)
      quote do
        def render(unquote(base_path), assigns) do
          EEx.eval_string(unquote(template), assigns)
        end
      end
    end
  end
end
