defmodule Glare.Executor do
  use GenServer
  require Logger

  @moduledoc """
  A GenServer that executes Siren.
  """
  
  @initial_state %{
    "tasks" => [],
    "last_execution" => DateTime.utc_now() |> DateTime.to_string 
  }

  def start_link(_) do
    GenServer.start_link(__MODULE__, @initial_state, name: :executor)
  end

  def init(state) do
    schedule_execution(1)
    {:ok, state}
  end

  def handle_info(:work, _state) do
    %{"tasks" => task_list} = Glare.SirenWrapper.run_siren()
    schedule_execution(30)

    Logger.info("Tasks list refreshed successfully")

    new_state = %{
      "tasks" => task_list,
      "last_execution" => string_now()
    }

    {:noreply, new_state}
  end

  def handle_call(:tasks, _from, state) do
    {:reply, state, state}
  end

  defp schedule_execution(seconds) do
    Process.send_after(self(), :work, seconds * 1000)
  end

  defp string_now, do: DateTime.utc_now |> DateTime.to_string
end
