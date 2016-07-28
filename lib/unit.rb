class Unit

  attr_reader :health_points
  attr_reader :attack_power

  def initialize(hp,ap) 
    @health_points = hp
    @attack_power = ap
  end

  def attack!(target)
    if target.is_a? Barracks
      target.damage_ineffective(attack_power)
    else
      target.damage(attack_power)
    end
  end

  def damage(hp)
    @health_points -= hp
  end

  def dead?
    health_points <= 0
  end

  def can_attack?(target)
    # self.attack_power > 0 &&    
    !self.dead? && !target.dead?
  end

end