defmodule MxTool do
  alias MxTool.Request

  @adapter Application.get_env(:mx_tool, :adapter, MxTool.Adapter.Live)

  def lookup(%Request{} = request), do: @adapter.lookup(request)

  def lookup(domain) when is_binary(domain) do
    domain
    |> Request.new
    |> lookup
  end
end
