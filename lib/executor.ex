defmodule Glare.Executor do
    use GenServer
    
    def start_link(_) do
        GenServer.start_link(__MODULE__, %{}, name: :executor)
    end

    def init(state) do
        # This is for when we'll implement websocket.
        # schedule_execution()
        {:ok, state}
    end

    def handle_info(:work, state) do
        Glare.TasksChannel.broadcast(%{tasks: "topkek"})
        schedule_execution()
        {:noreply, state}
    end

    def handle_call(:tasks, _from, state) do
        command_output = Glare.SirenWrapper.run_siren()
        {:reply, command_output, state}
    end

    defp schedule_execution() do
        Process.send_after(self(), :work, 30 * 1000)
    end
end