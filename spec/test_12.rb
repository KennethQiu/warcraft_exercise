require_relative 'spec_helper'

describe Unit do
  before :each do
    @dead_footman = Footman.new
    @dead_footman.damage(65)

    @footman = Footman.new
  end
  
  describe "#dead?" do

    it 'returns truthy if unit hp <= 0' do
      expect(@dead_footman.dead?).to be_truthy
    end

    it 'returns falsey if unit hp > 0' do
      expect(@footman.dead?).to be_falsey
    end

  end
  
  describe "#can_attack?" do
    it 'return falsey if unit is dead' do
      expect(@dead_footman.can_attack?(@footman)).to be_falsey
    end

    it 'return falsey if target is dead' do
      expect(@footman.can_attack?(@dead_footman)).to be_falsey
    end

    it 'returns truthy if both units are not dead' do
      other_unit = Peasant.new
      expect(@footman.can_attack?(other_unit)).to be_truthy
    end
  end

end