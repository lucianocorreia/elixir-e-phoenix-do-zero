defmodule ExMon do
  @moduledoc """
  ExMon keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias ExMon.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
end
