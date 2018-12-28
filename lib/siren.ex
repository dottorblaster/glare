defmodule Glare.SirenWrapper do
  @moduledoc """
  A wrapper for Siren's executable.
  """

  @command "siren"

  def run_siren() do
    {output, _exit_code} =
      System.cmd(@command, ["--file", System.get_env("SIRENFILE_PATH"), "--json-output"])

    Jason.decode!(output)
  end
end
