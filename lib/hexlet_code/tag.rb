# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[input img br].freeze
    class << self
      def build(tag, attrs)
        tag_attributes = build_attrs(attrs)

        if SINGLE_TAGS.include? tag
          "<#{tag}#{tag_attributes}>"
        else
          content = block_given? ? yield : ''
          "<#{tag}#{tag_attributes}>#{content}</#{tag}>"
        end
      end

      def build_attrs(attrs)
        return '' if attrs.empty?

        attrs.map do |key, value|
          "#{key}=\"#{value}\""
        end.join(' ').prepend(' ')
      end
    end
  end
end
