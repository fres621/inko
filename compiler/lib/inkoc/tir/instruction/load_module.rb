# frozen_string_literal: true

module Inkoc
  module TIR
    module Instruction
      class LoadModule
        include Predicates
        include Inspect

        attr_reader :register, :path, :location

        def initialize(register, path, location)
          @register = register
          @path = path
          @location = location
        end

        def visitor_method
          :on_load_module
        end
      end
    end
  end
end