# Stockastic

Simple Elixir wrapper for the [Stockfighter API](https://starfighter.readme.io/docs).

Documentation can be found [here](https://hexdocs.pm/stockastic)

## Quickstart

First, add Stockastic to your `mix.exs` dependencies:

```elixir
def deps do
  [{:stockastic, "~> 0.0.1"}]
end
```

Fetching dependencies and running on elixir console:

```console
mix deps.get
iex -S mix
```

You will see something like this:

```
Erlang/OTP 18 [erts-7.1] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.1.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Stockastic.start
```

## Contributing

Start by forking this repo

Then run this command to fetch dependencies and run tests:

```console
MIX_ENV=test mix do deps.get, test
```

Pull requests are greatly appreciated
