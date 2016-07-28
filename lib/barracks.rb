class Barracks

  attr_reader :gold
  attr_reader :food
  attr_reader :lumber
  attr_reader :health_points

  MAX_HEALTH = 500
  STARTING_GOLD = 1000
  STARTING_FOOD = 80
  STARTING_LUMBER = 500
  FM_COST_GOLD = 135
  FM_COST_FOOD = 2
  P_COST_GOLD = 90
  P_COST_FOOD = 5
  SE_COST_GOLD = 200
  SE_COST_LUMBER = 60
  SE_COST_FOOD = 3

  def initialize
    @gold = STARTING_GOLD
    @food = STARTING_FOOD
    @lumber = STARTING_LUMBER
    @health_points = MAX_HEALTH
  end

  def damage_ineffective(hp)
     @health_points -= ((hp.to_f/2).ceil)
  end 

  def damage_effective(hp)
     @health_points -= hp * 2
  end   

  def train_footman
    if can_train_footman?
      @gold -= FM_COST_GOLD
      @food -= FM_COST_FOOD
      Footman.new
    end
  end

  def can_train_footman?
    gold >= FM_COST_GOLD && food >= FM_COST_FOOD
  end

  def train_peasant
    if can_train_peasant?
      @gold -= P_COST_GOLD
      @food -= P_COST_FOOD
      Peasant.new
    end
  end

  def can_train_peasant?
    gold >= P_COST_GOLD && food >= P_COST_FOOD
  end

  def build_siegeengine
    if can_build_siegeengine?
      @gold -= SE_COST_GOLD
      @lumber -= SE_COST_LUMBER
      @food -= SE_COST_FOOD
      SiegeEngine.new
    end
  end

  def can_build_siegeengine?
    gold >= SE_COST_GOLD && lumber >= SE_COST_LUMBER && food >= SE_COST_FOOD
  end 
end
