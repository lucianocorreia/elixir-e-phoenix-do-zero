defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Player, Game}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Luciano", :chute, :soco, :cura)
      computer = Player.build("Roboto", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Luciano", :chute, :soco, :cura)
      computer = Player.build("Roboto", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Roboto"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Luciano"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Luciano", :chute, :soco, :cura)
      computer = Player.build("Roboto", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Roboto"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Luciano"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %ExMon.Player{
          life: 80,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Roboto"
        },
        player: %ExMon.Player{
          life: 95,
          moves: %{mov_avg: :soco, mov_heal: :cura, mov_rnd: :chute},
          name: "Luciano"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
