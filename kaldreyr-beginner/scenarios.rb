module Scenarios
 def captive_and_wizard(ary)
    if ary.include? "Captive" and ary.include? "Wizard"
      c_index = ary.index "Captive"
      w_index = ary.index "Wizard"

      return @action_queue << :shoot_bow! if c_index > w_index

      if c_index < w_index
        return @action_queue << :walk_forward! if ary[0] == "nothing"
        return @action_queue << :rescue_captive! if ary[0] == "Captive"
      end
    end
  end

  def include_wizard?(ary)
    if ary.include? "Wizard"
      w_index = ary.index "Wizard"
      @action_queue << :shoot_bow!
    end
  end

  def include_captive?(ary)
    if ary.include? "Captive"
      index = @env[:forward].index "Captive"
      return @action_queue << :rescue_captive! if index == 0
    end
  end

  def nothing_so_far_as_i_can_see(ary)
    if ary[0] == "nothing" and ary[1] == "nothing" and ary[2] == "nothing"
      return @action_queue << :walk_forward!
    end
  end

  def theres_a_wall!(ary)
    @action_queue << :walk_forward! if ary.include? "wall"
  end
end
