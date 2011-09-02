require 'test_helper'

class PolicyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Policy.new.valid?
  end
end
