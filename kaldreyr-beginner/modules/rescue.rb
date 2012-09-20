module Rescue
  def rescue_c!(warrior, direction)
    return warrior.rescue!(direction)
  end

  def rescue_captive!(warrior)
    return rescue_c!(warrior, :forward) if warrior.feel.captive?
    return rescue_c!(warrior, :backward) if warrior.feel(:backward).captive?
  end
end
