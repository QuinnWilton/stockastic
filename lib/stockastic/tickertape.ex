defmodule Stockastic.Tickertape do
  defmodule WS do
    @doc """
    Helper function to connect to the specified SSL-enabled websocket endpoint on the www.stockfighter.io host.
    """
    def connect(path) do
      Socket.Web.connect! "www.stockfighter.io", 443, [path: path, secure: true]
    end

    @doc """
    Helper function to semantically-clear handle websocket reconnects
    """
    def reconnect(socket) do
      connect socket.path
    end

    @doc """
    Function to get and parse JSON payload from the open socket.
    Properly (and without any indication) acknowledges server-sent pings.
    Tries to reconnect on protocol failures.
    """
    def get(socket) do
      case Socket.Web.recv(socket) do
        {:ok, {:text, text}} -> Stockastic.parse(text)
        {:ok, {:ping, cookie}} -> 
          Socket.Web.pong(socket, cookie || "")
          get(socket)
        {:ok, {:close, :protocol_error, reason }} ->
          IO.puts "Socket is closed (#{reason}), reconnecting..."
          get(reconnect(socket))
        packet ->
          raise "Unknown packet: #{inspect(packet)}"
      end
    end
  end

  @doc """
  Returns a `Socket.Web` object with tickertape for the selected venue.
  You can use `Stockastic.Tickertape.WS.get` to get an individual JSON payload from there, or
  `Stockastic.Tickertape.stream` to convert this websocket into a `Stream` of events from the venue
  """
  def new(account, venue) do
    WS.connect "/ob/api/ws/#{account}/venues/#{venue}/tickertape"
  end

  @doc """
  Returns a `Socket.Web` object with tickertape for the selected venue for a certain ticker.
  You can use `Stockastic.Tickertape.WS.get/1` to get an individual JSON payload from there, or
  `Stockastic.Tickertape.stream/1` to convert this websocket into a `Stream` of events from the venue
  """
  def new(account, venue, ticker) do
    WS.connect "/ob/api/ws/#{account}/venues/#{venue}/tickertape/stocks/#{ticker}"
  end

  @doc """
  Converts a `Socket.Web` object into a `Stream` of stream-emitted JSON objects.
  Uses `Stockastic.Tickertape.WS.get/1` internally, so ping requests and reconnects should be handled
  automatically.

  ## Example

      tickertape = Stockastic.Tickertape.new(account, venue)
      stream = Stockastic.Tickertape.stream(tickertape)
      for event <- stream do
        IO.inspect event
      end

  """
  def stream(socket) do
    Stream.repeatedly(fn -> WS.get(socket) end)
  end

end
