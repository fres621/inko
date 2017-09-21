# frozen_string_literal: true

module Inkoc
  module Codegen
    class CompiledCode
      include Inspect

      attr_reader :name, :instructions, :literals, :code_objects, :catch_table

      attr_accessor :arguments, :required_arguments, :rest_argument, :locals,
                    :registers, :captures

      def initialize(name, location)
        @name = name
        @location = location
        @arguments = 0
        @required_arguments = 0
        @rest_argument = false
        @locals = 0
        @registers = 0
        @captures = false
        @instructions = []
        @literals = Literals.new
        @code_objects = Literals.new
        @catch_table = nil
      end

      def file
        @location.file.path
      end

      def line
        @location.line
      end

      def instruct(*args)
        @instructions << Instruction.named(*args)
      end
    end
  end
end
