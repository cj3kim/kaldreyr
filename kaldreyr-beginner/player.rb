require_relative "./modules/attack.rb"
require_relative "./modules/env.rb"
require_relative "./modules/movement.rb"
require_relative "./modules/rescue.rb"
require_relative "./modules/turn_check.rb"
require_relative "./modules/rest.rb"
require_relative "./modules/priority.rb"

class Player

  include Attack
  include Env
  include Movement
  include Rescue
  include TurnCheck
  include Rest
  include Priority

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

  def actions(warrior)
    examine_env(warrior)
    prioritize(warrior)

    @action_queue.each do |action|
      self.send action, warrior
    end
  end

end
