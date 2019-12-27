defmodule Glare.Executor do
  use GenServer
  require Logger

  @moduledoc """
  A GenServer that executes Siren.
  """

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{"tasks" => []}, name: :executor)
  end

  def init(state) do
    schedule_execution(1)
    {:ok, state}
  end

  def handle_info(:work, state) do
    %{"tasks" => task_list} = Glare.SirenWrapper.run_siren()
    schedule_execution(30)
    Logger.info("Tasks list refreshed successfully")
    {:noreply, %{"tasks" => task_list}}
  end

  def handle_call(:tasks, _from, state) do
    {:reply, state, state}
  end

  defp schedule_execution(seconds) do
    Process.send_after(self(), :work, seconds * 1000)
  end
end
