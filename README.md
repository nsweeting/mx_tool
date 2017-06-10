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
MxTool.query("google.com") => {:ok, %MxTool.Response{
                                      lowest_record: "aspmx.l.google.com",
                                      records: [{40, "alt3.aspmx.l.google.com"}, {30, "alt2.aspmx.l.google.com"},
                                                {50, "alt4.aspmx.l.google.com"}, {10, "aspmx.l.google.com"},
                                                {20, "alt1.aspmx.l.google.com"}]}}
MxTool.query("ndndndsmfhsjrjhjsjhf.com") => {:error, :no_records}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mx_tool](https://hexdocs.pm/mx_tool).

