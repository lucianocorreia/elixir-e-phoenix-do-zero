defmodule ExMon do
  @moduledoc """
  ExMon keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias ExMon.{Pokemon, Trainer}

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate get_pokemon(params), to: Pokemon.Get, as: :call

  defdelegate create_trainer_pokemon(params), to: Trainer.Pokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(params), to: Trainer.Pokemon.Delete, as: :call
end
