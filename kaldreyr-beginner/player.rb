

class Player

  def initialize
    @max_health = 20
    @current_health = @max_health
    @prev_health = @current_health
  end

  def play_turn(warrior)
    start_turn_check(warrior)
    actions(warrior)
    end_turn_check(warrior)
  end

  def start_turn_check(warrior)
    @damage_since_last_turn = @prev_health > warrior.health
  end

  def actions(warrior)
    wall?(warrior)
    rescue_captive(warrior)
    swing_sword(warrior)
    shoot_bow(warrior)
    back_away(warrior)
    safe_rest(warrior)
    walk_forward!(warrior)
  end


  def wall?(warrior)
    return warrior.pivot! if warrior.feel.wall?
  end

  def back_away(warrior)
    return warrior.walk!(:backward) if @damage_since_last_turn and warrior.feel.empty? and warrior.health < 10
  end

  def shoot_bow(warrior)
    return warrior.shoot!
  end

  def rescue_captive(warrior)
    return warrior.rescue! if warrior.feel.captive?
    return warrior.rescue!(:backward) if warrior.feel(:backward).captive?
  end

  def swing_sword(warrior)
    return warrior.attack! if !warrior.feel.empty? and !warrior.feel.captive?
    return warrior.attack!(:backward) if !warrior.feel(:backward).empty? and !warrior.feel(:backward).captive?
  end

  def safe_rest(warrior)
    return warrior.rest! if !@damage_since_last_turn and warrior.health < 15
  end

  def walk_forward!(warrior)
    return warrior.walk! if warrior.feel.empty?
  end

  def end_turn_check(warrior)
    @prev_health = warrior.health
  end

  def hurt?
    warrior.health < @max_health
  end

  def maimed?
    warrior.health < 10
  end

end
