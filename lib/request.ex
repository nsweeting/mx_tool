defmodule MxTool.Request do
  @moduledoc false

  alias MxTool.Request

  defstruct [
    :domain
  ]

  def new(domain) when is_binary(domain) do
    %Request{domain: domain}
  end
end
