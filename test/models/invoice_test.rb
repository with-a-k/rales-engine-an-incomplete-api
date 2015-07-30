require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "it has an id" do
    assert Invoice.first.respond_to?("id")
  end

  test "it has an associated customer" do
    assert Invoice.first.respond_to?("customer_id")
    assert Invoice.first.respond_to?("customer")
  end

  test "it has an associated merchant" do
    assert Invoice.first.respond_to?("merchant_id")
    assert Invoice.first.respond_to?("merchant")
  end

  test "it has a status" do
    assert Invoice.first.respond_to?("status")
  end
end
