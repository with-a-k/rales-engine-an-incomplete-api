require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "it has an id" do
    assert Transaction.first.respond_to?("id")
  end

  test "it has an associated invoice" do
    assert Transaction.first.respond_to?("invoice_id")
    assert Transaction.first.respond_to?("invoice")
  end

  test "it has credit card information" do
    assert Transaction.first.respond_to?("credit_card_number")
    assert Transaction.first.respond_to?("credit_card_expiration_date")
  end

  test "it has a result" do
    assert Transaction.first.respond_to?("result")
  end
end
