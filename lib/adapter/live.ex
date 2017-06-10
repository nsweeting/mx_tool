defmodule MxTool.Adapter.Live do
  alias MxTool.{Request, Response}

  @behaviour MxTool.Adapter.Base

  def lookup(%Request{domain: domain}), do: lookup(domain)
  def lookup(domain) when is_binary(domain) do 
    domain
    |> to_charlist
    |> lookup
  end
  def lookup(domain) when is_list(domain) do
    domain
    |> lookup_all
    |> Response.new
  end

  defp lookup_all(domain) do
    domain
    |> :inet_res.lookup(:in, :mx)
    |> normalize_records
  end

  defp normalize_records(nil), do: []
  defp normalize_records(domains) do
    Enum.map(domains, fn({priority, domain}) -> 
      {priority, to_string(domain)}
    end)
  end
end
