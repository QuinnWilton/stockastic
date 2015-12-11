defmodule Stockastic.Orders do
  import Stockastic
  alias Stockastic.Client

  @type order :: %{
    account:   String.t,
    venue:     String.t,
    stock:     String.t,
    price:     integer,
    qty:       integer,
    direction: :buy | :sell,
    orderType: :limit | :market | :"fill-or-kill" | :"immediate-or-cancel"
  }

  @doc """
  List all orders on a venue for a particular account

  ## Example

      Stockastic.Orders.list "ROBUST", "FOO123", client

  More info at: https://starfighter.readme.io/docs/status-for-all-orders
  """
  @spec list(binary, binary, Client.t) :: Stockastic.response
  def list(venue, account, client) do
    get "venues/#{venue}/accounts/#{account}/orders", client
  end

  @doc """
  List all orders on a venue for a particular account and stock

  ## Example

      Stockastic.Orders.list "ROBUST", "FOO123", "ROBO", client

  More info at: https://starfighter.readme.io/docs/status-for-all-orders-in-a-stock
  """
  @spec list_for_stock(binary, binary, binary, Client.t) :: Stockastic.response
  def list_for_stock(venue, account, stock, client) do
    get "venues/#{venue}/accounts/#{account}/stocks/#{stock}/orders", client
  end

  @doc """
  Find an order for a stock on a particular venue

  ## Example

      Stockastic.Orders.find "LOBHEX", "LPEI", 1, client

  More info at: https://starfighter.readme.io/docs/status-for-an-existing-order
  """
  @spec find(binary, binary, integer, Client.t) :: Stockastic.response
  def find(venue, stock, id, client) do
    get "venues/#{venue}/stocks/#{stock}/orders/#{id}", client
  end

  @doc """
  Cancel an order

  ## Example

      Stockastic.Orders.cancel "LOBHEX", "LPEI", 1, client

  More info at: https://starfighter.readme.io/docs/cancel-an-order
  """
  @spec cancel(binary, binary, integer, Client.t) :: Stockastic.response
  def cancel(venue, stock, id, client) do
    delete "venues/#{venue}/stocks/#{stock}/orders/#{id}", client
  end

  @doc """
  Place an order for a stock

  Order body example:

      %{
        account:   "MST92145671",
        venue:     "LOBHEX",
        stock:     "LPEI",
        qty:       100,
        direction: :buy,
        orderType: :market
      }

  ## Example

      Stockastic.Orders.place_order "LOBHEX", "LPEI", body, client

  More info at: https://starfighter.readme.io/docs/place-new-order
  """
  @spec place_order(binary, binary, order, Client.t) :: Stockastic.response
  def place_order(venue, stock, body, client) do
    post "venues/#{venue}/stocks/#{stock}/orders", client, body
  end
end
