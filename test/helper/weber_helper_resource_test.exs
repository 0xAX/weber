defmodule WeberHelperResourceTest do
  use ExUnit.Case

  import Weber.Helper.ResourceHelper

  test "Create script tag" do
    script = script("/static/test.js")
    assert(script == "<script type=\"text/javascript\" src=\"/static/test.js\"></script>")
  end

  test "Create script tag with default value" do
    script = script()
    assert(script == "<script type=\"text/javascript\" src=\"/static/application.js\"></script>")
  end

  test "Create style tag" do
    style = style("/static/test.css")
    assert(style == "<link href=\"/static/test.css\" rel=\"stylesheet\" media=\"screen\">")
  end

  test "Create style tag with default value" do
    style = style()
    assert(style == "<link href=\"/static/application.css\" rel=\"stylesheet\" media=\"screen\">")
  end

  test "Create favicon tag" do
    fav = favicon("/static/img/favicon.ico")
    assert(fav == "<link href=\"/static/img/favicon.ico\" rel=\"shortcut icon\" type=\"image/png\">")
  end

end
