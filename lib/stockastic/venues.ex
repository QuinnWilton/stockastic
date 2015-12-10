defmodule Stockastic.Venues do
  import Stockastic
  alias Stockastic.Client

  @doc """
  Checks if a particular venue is up

  ## Example

      Stockastic.Venues.heartbeat "TESTEX", client

  More info at: https://starfighter.readme.io/docs/venue-healthcheck
  """
  @spec heartbeat(binary, Client.t) :: Stockastic.response
  def heartbeat(venue, client) do
    get "venues/#{venue}/heartbeat", client
  end
end
