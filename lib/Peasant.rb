class Peasant < Unit 

  MAX_HEALTH = 35
  DEFAULT_ATTACK_POWER = 0

  def initialize
    super(MAX_HEALTH, DEFAULT_ATTACK_POWER)
  end

end