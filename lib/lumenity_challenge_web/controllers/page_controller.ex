defmodule LumenityChallengeWeb.PageController do
  use LumenityChallengeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
