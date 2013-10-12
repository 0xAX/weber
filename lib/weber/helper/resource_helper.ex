defmodule Weber.Helper.ResourceHelper do

  @moduledoc """
    Include static resources with Weber.Helper.ResourceHelper.
  """

  import Weber.Helper.Html

  @doc """
    Generates <script>...<script> resource.

    Example:

      #
      # Generates: <script type="text/javascript" src="/static/test.js"></script>
      # If no value is passed for src it defaults to "application.js"
      #
      script("/static/test.js")
      script()

  """
  def script(src // "/static/application.js") do
    tag(:script, "", [type: "text/javascript", src: src])
  end

  @doc """
    Generates <link ... > resource for style elements.

    Example:

      #
      # Generates: <link href="/static/test.css" rel="stylesheet" media="screen">
      # If no value is passed for href it defaults to "application.css"
      style("/static/test.css")
      style()
  """
  def style(href // "/static/application.css", media // "screen") do
    tag(:link, [href: href, rel: "stylesheet", media: media])
  end

  @doc """
    Include favicon to your html template.

    Example:

      #
      # Generates: <link href="/static/img/favicon.ico" rel="shortcut icon" type="image/png">
      #
      favicon("/static/img/favicon.ico")
  """
  def favicon(href, rel // "shortcut icon", type // "image/png") do
    tag(:link, [href: href, rel: rel, type: type])
  end

end
