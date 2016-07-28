class SiegeEngine < Unit
  
  MAX_HEALTH = 400
  DEFAULT_ATTACK_POWER = 50

  def initialize
    super(MAX_HEALTH, DEFAULT_ATTACK_POWER)
  end

  def can_attack?(target)
    target.is_a?(SiegeEngine) || target.is_a?(Barracks)
  end

end