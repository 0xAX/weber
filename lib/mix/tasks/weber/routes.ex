defmodule Mix.Tasks.Weber.Routes do

  @doc """
  Prints routes
  """
  def run([]) do
    Weber.run_weber
    formated_routes = routes(Route.__route__)

    Mix.shell.info(formated_routes)
    Weber.stop([])
  end

  def routes(routes) do
    formated_routes = Enum.map routes, fn(route) ->
      format_route(route)
    end


    Enum.join(formated_routes, "\n")
  end

  defp format_route(route) do
    elements = Enum.map route, fn(vals) ->
      {key, value} = vals
      case key do
        :method -> "#{String.rjust(value, 6)}  "
        :path -> String.ljust(value, 30)
        :controller -> "#{value}#"
        :action -> value
      end
    end

    Enum.join(elements)
  end

end
