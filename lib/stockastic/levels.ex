defmodule Stockastic.Levels do
  import Stockastic

  @moduledoc """
  This module exposes gm API, as described here:
  https://discuss.starfighters.io/t/the-gm-api-how-to-start-stop-restart-resume-trading-levels-automagically/143
  """

  @doc """
  Starts a level by its name

  ## Example

      Stockastic.Levels.start "first_steps", client

  """
  @spec start(binary, Client.t) :: Stockastic.response
  def start(level, client) do
    post "gm/levels/#{level}", client
  end

  @doc """
  NOT YET IMPLEMENTED ON SERVER, as of this writing

  List accessible levels, with their level ids

  ## Example

      Stockastic.Levels.list client

  """
  @spec list(Client.t) :: Stockastic.response
  def list(client) do
    get "gm/levels", client
  end

  defmodule Instances do

    @moduledoc """
    This module implements level instances manipulation API, as specified on
    https://discuss.starfighters.io/t/the-gm-api-how-to-start-stop-restart-resume-trading
    """

    @doc """
    Get the status (open/closed, tradingDay, etc) of the target level instance

    ## Example

        Stockastic.Levels.Instances.status 117261, client

    """
    @spec status(integer, Client.t) :: Stockastic.response
    def status(instance_id, client) do
      get "gm/instances/#{instance_id}", client
    end

    @doc """
    Restart given level instance

    ## Example

        Stockastic.Levels.Instances.restart 117261, client

    """
    @spec restart(integer, Client.t) :: Stockastic.response
    def restart(instance_id, client) do
      post "gm/instances/#{instance_id}/restart", client
    end

    @doc """
    Stop given level instance

    ## Example

        Stockastic.Levels.Instances.restart 117261, client

    """
    @spec stop(integer, Client.t) :: Stockastic.response
    def stop(instance_id, client) do
      post "gm/instances/#{instance_id}/stop", client
    end

    @doc """
    Resume given level instance
    (helpful to remind you trading account id or venues and tickers for the current puzzle)

    ## Example

        Stockastic.Levels.Instances.restart 117261, client

    """
    @spec resume(integer, Client.t) :: Stockastic.response
    def resume(instance_id, client) do
      post "gm/instances/#{instance_id}/resume", client
    end

  end

end
