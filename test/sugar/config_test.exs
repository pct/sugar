defmodule Sugar.ConfigTest do
  use ExUnit.Case, async: true
  import Sugar.Config

  test "get/1" do
    if Version.match?(System.version, "< 1.2.0") do
      expected_list = [true,
                       {:http,  [port: 4000]},
                       {:https, [certfile: "",
                                 keyfile: "",
                                 port: 4443]}]
    else
      expected_list = [{:http,  [port: 4000]},
                       {:https, [certfile: "",
                                 keyfile: "",
                                 port: 4443]},
                       true]
    end
    assert get(:router) === nil
    assert get(:config_test) === expected_list
  end

  test "get/2" do
    assert get(Router, :https_only) === nil
    assert get(:sugar, :views_dir)
  end

  test "get/3" do
    assert get(:sugar, :router, Router) === Router
    assert get(Router, :https_only, false) === false
  end
end
