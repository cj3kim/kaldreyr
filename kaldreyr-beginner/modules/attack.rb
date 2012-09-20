module Attack
  def swing_sword!(warrior)
    warrior.attack! if !warrior.feel.empty? and !warrior.feel.captive?
    warrior.attack!(:backward) if !warrior.feel(:backward).empty? and !warrior.feel(:backward).captive? and !warrior.feel(:backward).wall?
  end

  def shoot_bow!(warrior)
    warrior.shoot!
  end
end
