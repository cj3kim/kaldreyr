module Rest
  def safe_rest!(warrior)
    return warrior.rest! if !@damage_since_last_turn and warrior.health < 15
  end

end
