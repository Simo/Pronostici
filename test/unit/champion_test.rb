require 'test_helper'

class ChampionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Champion.new.valid?
  end
end
