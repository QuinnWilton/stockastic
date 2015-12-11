# Stockastic

Simple Elixir wrapper for the [Stockfighter API](https://starfighter.readme.io/docs).

Documentation can be found [here](https://hexdocs.pm/stockastic)

## Quickstart

First, add Stockastic to your `mix.exs` dependencies:

```elixir
def deps do
  [{:stockastic, "~> 0.0.2"}]
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

## Examples

Instantiating an authenticated client:

```
iex(1)> client = Stockastic.Client.new(%{access_token: "API_TOKEN_HERE"})
%Stockastic.Client{auth: %{access_token: "API_TOKEN_HERE"},
 endpoint: "https://api.stockfighter.io/ob/api/"}
```

List stocks for a venue:

```
iex(2)> Stockastic.Stocks.list("EMWEX", client)                                                    
%{"ok" => true,
  "symbols" => [%{"name" => "IdeaMountain Ltd.", "symbol" => "IML"}]}
```

Listing orders for a stock, on a venue:

```
iex(3)> Stockastic.Orders.list_for_stock("EMWEX", "YS53802698", "IML", client)                     
%{"ok" => true, "orders" => []}
```

Fetching the orderbook for a stock, on a venue:

```
iex(4)> Stockastic.Stocks.orderbook("EMWEX", "IML", client)                                        
%{"asks" => nil,
  "bids" => [%{"isBuy" => true, "price" => 6019, "qty" => 176},
   %{"isBuy" => true, "price" => 5765, "qty" => 1691},
   %{"isBuy" => true, "price" => 5737, "qty" => 1691},
   %{"isBuy" => true, "price" => 5709, "qty" => 1691}], "ok" => true,
  "symbol" => "IML", "ts" => "2015-12-11T20:25:06.068350021Z",
  "venue" => "EMWEX"}
```

Further documentation is available [here](https://hexdocs.pm/stockastic).

## Contributing

Start by forking this repo

Then run this command to fetch dependencies and run tests:

```console
MIX_ENV=test mix do deps.get, test
```

Pull requests are greatly appreciated
