defmodule Stockastic.Tickertape do
  defmodule WS do
    def connect(path) do
      Socket.Web.connect! "www.stockfighter.io", 443, [path: path, secure: true]
    end

    def reconnect(socket) do
      connect socket.path
    end

    def get(socket) do
      case Socket.Web.recv(socket) do
        {:ok, {:text, text}} -> text
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

  def new(account, venue) do
    WS.connect "/ob/api/ws/#{account}/venues/#{venue}/tickertape"
  end

  def new(account, venue, ticker) do
    WS.connect "/ob/api/ws/#{account}/venues/#{venue}/tickertape/stocks/#{ticker}"
  end

  def stream(socket) do
    Stream.repeatedly(fn -> WS.get(socket) end)
  end

end
