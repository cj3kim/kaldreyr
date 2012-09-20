module Movement

  def walk_forward!(warrior)
    return warrior.walk! if warrior.feel.empty?
  end

  def back_away(warrior)
    return warrior.walk!(:backward) if @damage_since_last_turn and warrior.feel.empty? and warrior.health < 10
  end

end
