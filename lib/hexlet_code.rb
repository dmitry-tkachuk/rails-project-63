# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormRender, 'hexlet_code/form_render.rb'
  autoload :Version, 'hexlet_code/version.rb'
  autoload :Inputs, 'hexlet_code/inputs.rb'

  def self.form_for(object, **attributes)
    builded_form = FormBuilder.new(object, attributes)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form)
  end
end
