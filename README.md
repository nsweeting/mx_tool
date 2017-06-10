# MxTool

Find the mail exchanger for a given hostname.

## Installation

Add the following to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:mx_tool, "~> 0.1.0"}]
end
```

## Usage

```elixir
MxTool.lookup("google.com") => {:ok, %MxTool.Response{
                                      lowest_record: "aspmx.l.google.com",
                                      records: [{40, "alt3.aspmx.l.google.com"}, {30, "alt2.aspmx.l.google.com"},
                                                {50, "alt4.aspmx.l.google.com"}, {10, "aspmx.l.google.com"},
                                                {20, "alt1.aspmx.l.google.com"}]}}
MxTool.lookup("ndndndsmfhsjrjhjsjhf.com") => {:error, :no_records}
```