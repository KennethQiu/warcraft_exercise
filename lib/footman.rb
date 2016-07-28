# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit


  MAX_HEALTH = 60
  DEFAULT_ATTACK_POWER = 10

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(MAX_HEALTH, DEFAULT_ATTACK_POWER)
  end

end
