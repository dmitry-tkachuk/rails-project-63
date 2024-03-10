# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      TAG_NAME = 'input'

      def render
        tag = HexletCode::Tag.build(TAG_NAME, @attributes)
        "  #{label}\n  #{tag}\n"
      end

      def self.default_attributes
        { type: 'text' }
      end
    end
  end
end
