defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  describe "changeset/1" do
    test "when all params are valid, returns valid changeset" do
      params = %{name: "Luciano", password: "1234567"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{name: "Luciano", password: "1234567"},
               errors: [],
               data: %ExMon.Trainer{},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{password: "1234567"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{password: "1234567"},
               data: %ExMon.Trainer{},
               valid?: false
             } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid, returns a trainer struct" do
      params = %{name: "Luciano", password: "1234567"}

      response = Trainer.build(params)

      assert {:ok, %Trainer{name: "Luciano", password: "1234567"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{password: "1234567"}

      response = Trainer.build(params)

      assert {:error, %Ecto.Changeset{valid?: false}} = response

      {:error, changeset} = response
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
