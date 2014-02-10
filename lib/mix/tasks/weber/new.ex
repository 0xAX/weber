defmodule Mix.Tasks.Weber.New do

  def run([]) do
    Mix.shell.info """
    Usage:

      mix weber.new /home/user/my_web_app - Give path to directory where you want your Weber app to be generated.
    """
  end

  @doc """
  Create default weber based project.
  """
  def run([directoryName]) do
    # create project directory
    case File.mkdir(directoryName) do
      :ok -> :ok
      err -> :io.format("[Weber error] Can't create project directory. Error: ~p~n", [err])
    end

    #
    # create project skeleton
    #
    path = Path.expand directoryName
    baseName = Path.basename directoryName

    vars = HashDict.new [
    {"path", path},
    {"projectNamespace", Mix.Utils.camelize(baseName)},
      {"projectName", baseName}
      ]

      template = "default"
      {:ok, pwd} = File.cwd
      skelRoot = pwd <> "/templates/" <> template
      File.cd skelRoot
      skelFiles = Weber.Utils.get_all_files(".")
      lc file inlist skelFiles do
        baseFile = String.slice(file, 1, 1024)
        destination = path <> replace(baseFile, vars)
        dir = :filename.dirname(destination)
        if !:filelib.is_dir(dir), do: Mix.Generator.create_directory dir
        File.cp_r file, destination, fn _, _ -> true end
        {:ok, origin} = File.read destination
        compiled = replace(origin, vars)
        File.write destination, compiled, []
      end
  end

  defp replace(text, vars) do
    case Enum.uniq(Regex.scan(%r/\#\{([^\}]+)\}/, text)) do
      []   -> text
      data -> replace_act(text, vars, data)
    end
  end

  defp replace_act(text, _vars, []) do
    text
  end

  defp replace_act(text, vars, [[entry, key] | tail]) do
    replace_act(String.replace(text, entry, HashDict.get(vars, key), []), vars, tail)
  end

end
