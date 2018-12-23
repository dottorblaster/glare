defmodule Glare.SirenWrapper do
  @command "siren"
  @sirenfile_path "/Users/blaster/Desktop/projects/infrastructure/Sirenfile.json"

  def run_siren() do
    {output, _exit_code} = System.cmd(@command, ["--file", @sirenfile_path, "--json-output"])
    Jason.decode!(output)
  end
end
