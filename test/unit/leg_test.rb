require 'test_helper'

class LegTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Leg.new.valid?
  end
end
