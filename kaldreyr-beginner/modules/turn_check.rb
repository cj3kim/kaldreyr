module TurnCheck
  def start_turn_check(warrior)
    @damage_since_last_turn = @prev_health > warrior.health
  end

  def end_turn_check(warrior)
    @prev_health = warrior.health
  end
end
