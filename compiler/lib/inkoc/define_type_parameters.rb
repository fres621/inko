# frozen_string_literal: true

module Inkoc
  module DefineTypeParameters
    def define_type_parameters(arguments, type)
      arguments.each do |arg_node|
        required_traits = arg_node.required_traits.map do |node|
          type_for_constant(node, [type, self.module])
        end

        arg = Type::TypeParameter.new(arg_node.name, Set.new(required_traits))

        type.define_type_parameter(arg.name, arg)
      end
    end
  end
end