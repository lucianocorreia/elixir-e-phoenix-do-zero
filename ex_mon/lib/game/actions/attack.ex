defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game
  alias ExMon.Game.Status
  @mov_avg_power 18..25
  @mov_rnd_power 10..35

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)

    opponent
    |> Game.fetch_opponent()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent, damage)
  end

  defp calculate_power(:mov_avg), do: Enum.random(@mov_avg_power)
  defp calculate_power(:mov_rnd), do: Enum.random(@mov_rnd_power)

  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent, damage) do
    opponent
    |> Game.fetch_opponent()
    |> Map.put(:life, life)
    |> update_game(opponent, damage)
  end

  defp update_game(player, opponent, damage) do
    Game.info()
    |> Map.put(opponent, player)
    |> Game.update()

    Status.print_move_message(opponent, :attack, damage)
  end
end
