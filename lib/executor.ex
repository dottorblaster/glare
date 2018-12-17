defmodule Glare.Executor do
    use GenServer
    
    def start_link(_) do
        GenServer.start_link(__MODULE__, %{})
    end

    def init(state) do
        schedule_execution()
        {:ok, state}
    end

    def handle_info(:work, state) do
        Glare.TasksChannel.broadcast(%{tasks: "topkek"})
        schedule_execution()
        {:noreply, state}
    end

    defp schedule_execution() do
        Process.send_after(self(), :work, 30 * 1000)
    end
end