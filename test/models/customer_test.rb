require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "it has an id" do
    assert Customer.first.respond_to?("id")
  end

  test "it has a first name" do
    assert Customer.first.respond_to?("first_name")
  end

  test "it has a last name" do
    assert Customer.first.respond_to?("last_name")
  end
end
