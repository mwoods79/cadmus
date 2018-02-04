defmodule Cadmus.DogView do
  # EEx is really a topic for the next workshop when we talk about templates.
  # However, I think it is worth mentioning this time.
  def render("index.html", assigns) do
    template = """
    <ul><%= for dog <- dogs do %><li><%= dog[:name] %></li><% end %></ul>
    """

    EEx.eval_string(template, assigns)
  end

  ### Problem 3:
  #
  # Using the example above, convert the following function to use EEx.
  def render("create.html", assigns) do
    template = """
    <ul><li><%= name %></li></ul>
    """

    EEx.eval_string(template, assigns)
  end

  ## Problem 4:
  #
  # Convert the Cadmus.HelloController to use the new hotness. Add a file
  # Cadmus.HelloView. Make sure it's using EEx as well.
end
