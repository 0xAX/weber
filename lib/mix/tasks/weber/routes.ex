defmodule Mix.Tasks.Weber.Routes do

  @doc """
  Prints routes
  """
  def run([]) do
    Weber.run_weber
    routes = Route.__route__

    Mix.shell.info(inspect(routes))
    Weber.stop([])
  end

end
