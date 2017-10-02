# frozen_string_literal: true

module Inkoc
  module Type
    module ObjectOperations
      def define_attribute(*args)
        attributes.define(*args)
      end

      def lookup_attribute(name)
        source = self

        while source
          attr = attributes[name]

          return attr if attr

          source = source.prototype
        end

        nil
      end

      def lookup_type(name)
        lookup_attribute(name).type
      end

      def lookup_method(name)
        source = self

        while source
          method = source.lookup_attribute(name)

          return method unless method.nil?

          source = source.prototype
        end

        # If we didn't find anything we'll return the last looked up value,
        # which will be a NullSymbol.
        method
      end

      def return_type
        self
      end

      def message_return_type(name)
        lookup_method(name).type.return_type
      end

      def responds_to_message?(name)
        lookup_method(name).type.block?
      end

      def attribute?(name)
        lookup_attribute(name).any?
      end
    end
  end
end