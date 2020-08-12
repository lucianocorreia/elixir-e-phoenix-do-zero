defmodule ExMon.Trainer do
  @moduledoc """
  ExMon trainer
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string

    timestamps()
  end
end
