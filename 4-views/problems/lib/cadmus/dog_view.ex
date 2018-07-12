defmodule Cadmus.DogView do
  # Problem 1.
  # Phoenix template functions do not need to be defined. If there is a view
  # named `create.html.eex` in the right spot then phoenix will automatically
  # create a render function for it. Using our knowledge (and a refresher) about
  # macros write a macro that will read all the files in a folder and create
  # functions for them. All tests should still pass when youre done.
  #
  # HINTS:
  # Look at Elixirs keyword module to see how to get values from the opts
  # Path.wildcard("path/*.eex) will return a list of eex files in that path
  # Path.basename("dog.html.eex", ".eex") will return "dog.html"
  def render("index.html", assigns) do
    template = """
    <ul><%= for dog <- dogs do %><li><%= dog[:name] %></li><% end %></ul>
    """

    EEx.eval_string(template, assigns)
  end

  def render("create.html", assigns) do
    template = """
    <ul><li><%= name %></li></ul>
    """

    EEx.eval_string(template, assigns)
  end
end
