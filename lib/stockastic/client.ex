defmodule Stockastic.Client do
  defstruct auth: nil, endpoint: "https://api.stockfighter.io/ob/api/"

  @type auth :: %{access_token: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(auth) :: t
  def new(auth),  do: %__MODULE__{auth: auth}

  @spec new(auth, binary) :: t
  def new(auth, endpoint) do
    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
