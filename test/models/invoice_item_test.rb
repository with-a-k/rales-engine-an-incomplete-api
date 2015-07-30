require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "it has an id" do
    assert InvoiceItem.first.respond_to?("id")
  end

  test "it has an associated item" do
    assert InvoiceItem.first.respond_to?("item_id")
    assert InvoiceItem.first.respond_to?("item")
  end

  test "it has an associated invoice" do
    assert InvoiceItem.first.respond_to?("invoice_id")
    assert InvoiceItem.first.respond_to?("invoice")
  end

  test "it has a quantity" do
    assert InvoiceItem.first.respond_to?("quantity")
  end

  test "it has a unit price" do
    assert InvoiceItem.first.respond_to?("unit_price")
  end
end
