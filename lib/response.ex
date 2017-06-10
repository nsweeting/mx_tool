defmodule MxTool.Response do
  @moduledoc false

  alias MxTool.Response

  defstruct [
    :records,
    :lowest_record
  ]

  def new([]), do: {:invalid, :no_records}
  def new(records) when is_list(records) do
    {:ok, records |> to_response}
  end

  defp to_response(records) do
    %Response{
      records: records,
      lowest_record: records |> take_lowest_record,
    }
  end

  defp take_lowest_record([]), do: nil
  defp take_lowest_record(records) do
    records
    |> sort_by_priority
    |> List.first
    |> record_to_domain
  end

  defp sort_by_priority([]), do: []
  defp sort_by_priority(records) do
    Enum.sort(records, fn({priority, _}, {other_priority, _}) ->
      priority < other_priority
    end)
  end

  defp record_to_domain(nil), do: nil
  defp record_to_domain({_, domain}), do: domain
end
