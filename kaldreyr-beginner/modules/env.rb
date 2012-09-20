module Env
  def wall?(warrior)
    return warrior.pivot! if warrior.feel.wall?
  end

  def examine_env(warrior)
    @env = { forward:{}, backward: {} }

    @env[:forward][:string] = warrior.look.map! do |elem|
      elem.to_s
    end

    @env[:backward][:string] = warrior.look(:backward).map! do |elem|
      elem.to_s
    end

    @env[:forward][:enemy] = warrior.look.map! do |elem|
      elem.enemy?
    end

    @env[:backward][:enemy] = warrior.look(:backward).map! do |elem|
      elem.enemy?
    end

    @env[:forward][:captive] = warrior.look.map! do |elem|
      elem.captive?
    end

    @env[:backward][:captive] = warrior.look(:backward).map! do |elem|
      elem.captive?
    end


  end
end
