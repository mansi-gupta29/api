defmodule Api.Worker do
  use GenServer
  alias Api.{Worker}

  ### Public API

  def start_link(args) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def get() do
    GenServer.call(Worker, {:get})
  end

  ### Server Callbacks

  def init(_) do
    Process.send_after(self(), :update, 1000)
    {:ok, zero_state()}
  end

  def handle_info(:update, state) do
    Api.update()
    Process.send_after(self(), :update, 60 * 1000)
    {:noreply, state |> Map.put(:max_number, Enum.random(0..100))}
  end

  def handle_call({:get}, _from, state) do
    max_users = state |> Map.get(:max_number) |> Api.get_users_with_max_points()

    data = %{
      users: max_users,
      timestamp: DateTime.utc_now()
    }

    {:reply, data, state |> Map.put(:timestamp, DateTime.utc_now())}
  end

  defp zero_state() do
    max_num = Enum.random(0..100)
    %{max_number: max_num, timestamp: nil}
  end
end
