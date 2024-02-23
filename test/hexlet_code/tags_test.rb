require 'minitest/autorun'
require_relative '../../lib/hexlet_code/tags'

class HexletCodeTagTest < Minitest::Test
  def test_single_tag_without_attributes
    result = HexletCode::Tag.build('br')
    assert_equal '<br>', result
  end

  def test_single_tag_with_attributes
    result = HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal '<img src="path/to/image">', result
  end

  def test_single_tag_with_multiple_attributes
    result = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal '<input type="submit" value="Save">', result
  end

  def test_pair_tag_with_text_body
    result = HexletCode::Tag.build('label') { 'Email' }
    assert_equal '<label>Email</label>', result
  end

  def test_pair_tag_with_attribute_and_text_body
    result = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal '<label for="email">Email</label>', result
  end

  def test_pair_tag_without_body
    result = HexletCode::Tag.build('div')
    assert_equal '<div></div>', result
  end
end
