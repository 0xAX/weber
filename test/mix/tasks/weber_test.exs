defmodule Mix.Tasks.WeberTest do
  use ExUnit.Case

  test "prints version" do
    Mix.Tasks.Weber.run ["--version"]
    assert_received { :mix_shell, :info, ["Weber v" <> _] }
  end

end
