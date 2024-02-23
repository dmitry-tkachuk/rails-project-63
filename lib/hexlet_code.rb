# frozen_string_literal: true

require_relative "hexlet_code/version"

# HexletCode for generating forms
module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag.rb"
end
