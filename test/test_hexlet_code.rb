# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_empty
    user = User.new(name: 'John', job: 'Developer')
    result = HexletCode.form_for(user)

    expected = <<~HTML.strip
      <form action="#" method="post"></form>
    HTML
    assert_equal expected, result
  end

  def test_form_for_with_url
    user = User.new(name: 'John', job: 'Developer')
    result = HexletCode.form_for(user, url: '/users')

    expected = <<~HTML.strip
      <form action="/users" method="post"></form>
    HTML
    assert_equal expected, result
  end

  def test_form_for_with_input
    user = User.new(name: 'John', job: 'Developer')
    result = HexletCode.form_for(user) do |f|
      f.input(:name)
    end

    expected_input
    assert_equal expected_input, result
  end

  def test_form_for_with_submit
    user = User.new(name: 'John', job: 'Developer')
    result = HexletCode.form_for(user, &:submit)

    expected = <<~HTML.strip
      <form action="#" method="post">
      <input type="submit" value="Save">
      </form>
    HTML
    assert_equal expected, result
  end

  def test_form_for_with_input_and_submit
    user = User.new(name: 'John', job: 'Developer')
    result = HexletCode.form_for(user) do |f|
      f.input(:name)
      f.submit
    end

    expected_input_and_submit
    assert_equal expected_input_and_submit, result
  end

  def expected_input
    <<~HTML.strip
      <form action="#" method="post">
      <label for="name">Name</label>
      <input name="name" type="text" value="John">
      </form>
    HTML
  end

  def expected_input_and_submit
    <<~HTML.strip
      <form action="#" method="post">
      <label for="name">Name</label>
      <input name="name" type="text" value="John">
      <input type="submit" value="Save">
      </form>
    HTML
  end
end
