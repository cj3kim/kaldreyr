require_relative "./scenarios.rb"

module Priority
  include Scenarios
  def prioritize(warrior)
    @action_queue = []

    fwd = @env[:forward]
    bwd = @env[:backward]

    #return decide_action_mode(fwd, bwd)

    return captive_and_wizard(fwd)
    return include_wizard?(fwd)
    return nothing_so_far_as_i_can_see(fwd)
    return theres_a_wall!(fwd)
  end

  #def attack_mode
    #find nearest enemy
    #start shooting
  #end

  #def defense_mode
  #end

  #def recover_mode
  #end

  #def rescue_mode

  #end

  def decide_action_mode(ary)
    @mode = nil

    if @current_health >= 18
      @mode = :rescue_mode
    elsif @current_health >= 15
      @mode = :attack_mode
    elsif @current_health >= 10
      @mode = :defense_mode
    else
      @mode = :recover_mode
    end
  end

 end
