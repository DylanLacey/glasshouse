require "glasshouse/version"

module Glasshouse
  class << self
    def store
      @store ||= {}
    end

    def plant values, &block
      stored_values = {}
      new_values = []
      values.keys.each do |key|
        if ENV.keys.include? key
          stored_values[key] = ENV[key]
        else
          new_values << key
        end

        ENV[key] = values[key]
      end

      begin
        block.call
      ensure
        stored_keys = stored_values.keys

        values.keys.each do |key|
          if stored_keys.include? key
            ENV[key] = stored_values[key]
          else
            ENV.delete key
          end
        end

      end
    end

    def prune values, &block
      stored_values = {}
      
      values.each do |key|
        if ENV.keys.include? key
          stored_values[key] = ENV[key]
          ENV.delete key
        end
      end

      begin
        block.call
      ensure
        stored_keys = stored_values.keys

        stored_keys.each do |key|
          ENV[key] = stored_values[key]
        end
      end
    end
  end
end
