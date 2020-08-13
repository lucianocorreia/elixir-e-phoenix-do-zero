defmodule ExMon.Trainer.Create do
  alias ExMon.{Repo, Trainer}

  def call(params) do
    params
    |> Trainer.build()
    |> create_trainer()
  end

  defp create_trainer({:ok, trainer}), do: Repo.insert(trainer)
  defp create_trainer({:error, _changeset} = error), do: error
end
