require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "it has an id" do
    assert Item.first.respond_to?("id")
  end

  test "it has an associated merchant" do
    assert Item.first.respond_to?("merchant_id")
    assert Item.first.respond_to?("merchant")
  end

  test "it has a name" do
    assert Item.first.respond_to?("name")
  end

  test "it has a description" do
    assert Item.first.respond_to?("description")
  end

  test "it has a unit price" do
    assert Item.first.respond_to?("unit_price")
  end
end
