require 'spec_helper'

describe Glasshouse do
  it 'has a version number' do
    expect(Glasshouse::VERSION).not_to be nil
  end

  describe '#grow' do
    it "adds a value to the Env Vars during a block" do
      Glasshouse.grow({"bulb" => "tulip"}) do
        expect(ENV['bulb']).to match "tulip"
      end
    end

    it "removes the value after the block" do
      Glasshouse.grow({"sprout" => "bean"}) do
        #null op
      end

      expect(ENV['sprout']).to be_nil
    end
  end

  describe "#prune" do
    before do
      ENV["roses"] = "thorny"
    end

    it "removes a value from the Env Vars during a block" do
      Glasshouse.prune(["roses"]) do
        expect(ENV["roses"]).to be nil
      end
    end

    it "restores the value after the block" do
      Glasshouse.prune(["roses"]) do
        #null op
      end

      expect(ENV["roses"]).to match "thorny"
    end
  end
end