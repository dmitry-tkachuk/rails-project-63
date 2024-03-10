# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = User.new name: 'John', job: 'Developer'
  end

  def test_it_generates_form
    expected = read_fixture('default_form')
    actual = HexletCode.form_for(@user)
    assert_equal expected, actual
  end

  def test_it_generates_form_with_input
    expected = read_fixture('input_form')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_textarea
    expected = read_fixture('input_textarea_form')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_input_additional_attrs
    expected = read_fixture('input_additional_attributes_form')
    actual = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_additional_attributes
    expected = read_fixture('submit_form')
    actual = HexletCode.form_for @user, url: '/profile', method: :get, class: 'hexlet-form', &:submit
    assert_equal expected, actual
  end

  def test_it_generates_form_with_submit
    expected = read_fixture('input_with_submit_form')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_submit_value
    expected = read_fixture('input_with_submit_value_form')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'value'
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_url
    expected = read_fixture('url_form')
    actual = HexletCode.form_for(@user, url: '/users')
    assert_equal expected, actual
  end

  def test_it_raise_on_struct_missing_method
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :schedule # missing field
        f.input :workload # missing field
      end
    end
  end
end
