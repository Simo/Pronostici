require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Round.new.valid?
  end
end
