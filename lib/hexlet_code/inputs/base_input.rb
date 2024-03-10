# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(attributes)
        @attributes = self.class.default_attributes.merge(attributes)
      end

      def label
        HexletCode::Tag.build('label', { for: @attributes[:name] }) do
          @attributes[:name].capitalize
        end
      end

      def self.default_attributes
        {}
      end
    end
  end
end
