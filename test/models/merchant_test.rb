require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "it has an id" do
    assert Merchant.first.respond_to?("id")
  end

  test "it has a name" do
    assert Merchant.first.respond_to?("name")
  end
end
