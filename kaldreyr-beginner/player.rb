

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

    p warrior.look

    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    elsif !warrior.feel.empty? and !warrior.feel.captive?
      return warrior.attack!
    elsif @damage_since_last_turn and warrior.feel.empty? and warrior.health < 10
      return warrior.walk!(:backward)
    elsif !@damage_since_last_turn and warrior.health < 15
      return warrior.rest!
    elsif warrior.feel.empty?
      return warrior.walk!
    else
      return
    end
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
