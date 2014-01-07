defmodule Mix.Tasks.Weber do

  @moduledoc """

    Create a new weber project template.

    Usage:

      mix weber.new /home/user/my_web_app - Creates myWebApp directory with weber project skeleton.
      mix weber.routes -- Prints out all defined routes.
      mix weber --version - Prints weber version.
      mix weber --help - Prints help.
  """

  @shortdoc "Create a new weber project"

  use Mix.Task

  @version Weber.Mixfile.project[:version]

  def run([]) do
    usage
  end

  def run(["--help"]) do
    usage
  end

  def run(["--version"]) do
    Mix.shell.info "Weber v#{@version}"
  end

  defp usage do
    Mix.shell.info """
    Usage:

      mix weber.new /home/user/my_web_app - Creates myWebApp directory with weber project skeleton.
      mix weber.routes -- Prints out all defined routes.
      mix weber --version - Prints weber version.
      mix weber --help - Prints help.
    """
  end

end
