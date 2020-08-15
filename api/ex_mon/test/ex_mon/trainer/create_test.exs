defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, create a trainer" do
      params = %{name: "Luciano", password: "1234567"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Luciano"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, returns the error" do
      params = %{password: "1234567"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
