require_relative 'spec_helper'

describe 'SiegeEngine' do 
  before :each do
    @siegeengine = SiegeEngine.new
  end

  describe 'initialization' do 
    it 'has and knows its HP, default to 400' do
      expect(@siegeengine.health_points).to eq(400)
    end

    it 'has and knows its AP, default to 50' do
      expect(@siegeengine.attack_power).to eq(50)
    end

    it 'is also an instance of Unit' do
      expect(@siegeengine).to be_a(Unit)
    end
  end

  describe "#can_attack?" do

    it "returns true if target is SiegeEngine" do
      @target_se = SiegeEngine.new
      expect(@siegeengine.can_attack?(@target_se)).to be_truthy
    end 

    it "returns true if target is Barracks" do
      @target_b = Barracks.new
      expect(@siegeengine.can_attack?(@target_b)).to be_truthy
    end

    it "returns false otherwise" do
      @target_f = Footman.new
      expect(@siegeengine.can_attack?(@target_f)).to be_falsey
    end
  end 
end

describe 'Barracks' do 
  before :each do
    @barracks = Barracks.new
  end

  it 'starts off with 500 lumber' do
    expect(@barracks.lumber).to be(500)
  end 

  describe "#build_siegeengine" do
    it 'consumes 200 gold, 60 lumber, and 3 food' do 
      # @barracks.should_receive(:gold).at_least(:once).and_return(200)
      # @barracks.should_receive(:lumber).at_least(:once).and_return(60)
      # @barracks.should_receive(:food).at_least(:once).and_return(3)
      @barracks.build_siegeengine
      expect(@barracks.gold).to eq(800)
      expect(@barracks.lumber).to eq(440)
      expect(@barracks.food).to eq(77)
    end

    it 'returns an SiegeEngine unit' do
      @siegeengine = @barracks.build_siegeengine
      expect(@siegeengine).to be_an_instance_of(SiegeEngine)
    end 
  end

  describe "#damage_effective" do
    it 'reduce hp by double to AP' do
      @barracks.damage_effective(10)
      expect(@barracks.health_points).to eq(480)
    end
  end

  describe "#can_build_siegeengine?" do
    before :each do
    end

    it "returns true if there's sufficient resources" do
      allow(@barracks).to receive(:gold).and_return(200)
      allow(@barracks).to receive(:lumber).and_return(60)
      allow(@barracks).to receive(:food).and_return(3)
      expect(@barracks.can_build_siegeengine?).to be_truthy
    end

    it 'returns false if lacking gold' do
      allow(@barracks).to receive(:gold).and_return(199)
      allow(@barracks).to receive(:lumber).and_return(60)
      allow(@barracks).to receive(:food).and_return(3)
      expect(@barracks.can_build_siegeengine?).to be_falsey
    end

    it 'returns false if lacking lumber' do
      allow(@barracks).to receive(:gold).and_return(200)
      allow(@barracks).to receive(:lumber).and_return(59)
      allow(@barracks).to receive(:food).and_return(3)  
      expect(@barracks.can_build_siegeengine?).to be_falsey
    end

    it 'returns false if lacking food' do
      allow(@barracks).to receive(:gold).and_return(200)
      allow(@barracks).to receive(:lumber).and_return(60)
      allow(@barracks).to receive(:food).and_return(2)      
      expect(@barracks.can_build_siegeengine?).to be_falsey
    end
  end
end
