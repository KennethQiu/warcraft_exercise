require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe 'initialization' do
    it 'has and knows its HP (health points)' do
      expect(@barracks.health_points).to eq(500)
    end
  end
  
  describe "#damage_ineffective" do
    it 'should reduce health_points by half of the attack power specified' do
      @barracks.damage_ineffective(10)
      expect(@barracks.health_points).to eq(495)
    end

    it 'the damage amount should be rounded up to the nearest integer' do
      @barracks.damage_ineffective(15)
      expect(@barracks.health_points).to eq(492)
    end
  end

  it "receives half damage from Footmen" do
    @footman = Footman.new
    @footman.attack!(@barracks) #footman AP = 10, Barracks health = 500
    expect(@barracks.health_points).to eq(495)
  end
    
end



