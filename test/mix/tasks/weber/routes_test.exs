defmodule Mix.Tasks.Weber.RoutesTest do
  use ExUnit.Case

  test "formats routes as nice string" do
    routes = [[method: "GET", path: "/", controller: Trash.Main, action: :index]]

    assert(Mix.Tasks.Weber.Routes.routes(routes) == "   GET  /                             Elixir.Trash.Main#index")
  end

end
