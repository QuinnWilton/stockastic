defmodule Stockastic.Stocks do
  import Stockastic
  alias Stockastic.Client

  @doc """
  List the stocks available for trading on a venue

  ## Example

      Stockastic.Stocks.list "OGEX", client

  More info at: https://starfighter.readme.io/docs/list-stocks-on-venue
  """
  @spec list(binary, Client.t) :: Stockastic.response
  def list(venue, client) do
    get "venues/#{venue}/stocks", client
  end

  @doc """
  Get the orderbook for a particular stock

  ## Example

      Stockastic.Stocks.orderbook "OGEX", "FAC", client

  More info at: https://starfighter.readme.io/docs/get-orderbook-for-stock
  """
  @spec orderbook(binary, binary, Client.t) :: Stockastic.response
  def orderbook(venue, stock, client) do
    get "venues/#{venue}/stocks/#{stock}", client
  end

  @doc """
  Get a quick look at the most recent trade information for a stock.

  ## Example

      Stockastic.Stocks.get_quote "OGEX", "FAC", client

  More info at: https://starfighter.readme.io/docs/a-quote-for-a-stock
  """
  @spec get_quote(binary, binary, Client.t) :: Stockastic.response
  def get_quote(venue, stock, client) do
    get "venues/#{venue}/stocks/#{stock}/quote", client
  end
end
