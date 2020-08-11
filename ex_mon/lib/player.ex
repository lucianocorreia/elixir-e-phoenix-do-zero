defmodule ExMon.Player do
  @required_keys [:life, :name, :moves]
  @max_life 100

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(name, mov_rnd, mov_avg, mov_heal) do
    %ExMon.Player{
      name: name,
      moves: %{
        mov_rnd: mov_rnd,
        mov_avg: mov_avg,
        mov_heal: mov_heal
      },
      life: @max_life
    }
  end
end
