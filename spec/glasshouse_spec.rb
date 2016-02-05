require 'spec_helper'

describe Glasshouse do
  it 'has a version number' do
    expect(Glasshouse::VERSION).not_to be nil
  end

  describe '#plant' do
    it "adds a value to the Env Vars during a block" do
      Glasshouse.plant({"bulb" => "tulip"}) do
        expect(ENV['bulb']).to match "tulip"
      end
    end

    it "removes the value after the block" do
      Glasshouse.plant({"sprout" => "bean"}) do
        #null op
      end

      expect(ENV['sprout']).to be_nil
    end

    describe "nested" do
      it "will overwrite existing values" do
        Glasshouse.plant({"robins_egg" => "blue"}) do
          Glasshouse.plant({"robins_egg" => "green"}) do
            expect(ENV["robins_egg"]).to match "green"
          end
        end
      end

      it "will restore those values afterwards" do
        Glasshouse.plant({"st_clemens" => "oranges"}) do
          Glasshouse.plant({"st_clemens" => "lemons"}) {}

          expect(ENV["st_clemens"]).to match "oranges"
        end
      end
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
      Glasshouse.prune(["roses"]) {}

      expect(ENV["roses"]).to match "thorny"
    end
  end
end