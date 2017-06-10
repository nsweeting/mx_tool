defmodule MxTool.Adapter.Base do
  @moduledoc ~S"""

  """

  @type request :: %MxTool.Request{}
  @type success :: {:ok, %MxTool.Response{}}
  @type error :: {:invalid, :no_records}

  @callback lookup(request) :: success | error
end
