defmodule ExMonTest do
  use ExUnit.Case

  alias ExMon.Player

  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "retuns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{mov_avg: :chute, mov_heal: :cura, mov_rnd: :soco},
        name: "Luciano"
      }

      assert expected_response == ExMon.create_player("Luciano", :chute, :soco, :cura)
    end
  end

  describe "starte_game/1" do
    test "when the game starts, returns a message" do
      player = Player.build("Luciano", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The Game Started"
      assert messages =~ "status: :started"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Luciano", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      assert messages =~ "The player attacked the computer dealing"
      assert messages =~ "It's computer turn"
    end

    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute_invalid)
        end)

      assert messages =~ "Invalid move"
    end
  end
end
