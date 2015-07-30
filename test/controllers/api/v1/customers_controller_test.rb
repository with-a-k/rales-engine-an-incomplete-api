require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  def setup
    @controller = Api::V1::CustomersController.new
  end

  test "it can return a random customer" do
    get :random, format: :json
    assert_response :success
    # does the response body appear in Customer.all?
    assert Customer.all.include?(response)
  end

  test "it can return a specific customer" do
    get :show, { 'id' => '12' }, format: :json
    assert_response :success
    # does the customer retrieved match the one expected?
    assert_equal Customer.find_by(id: 12).name, response['name']
  end

  test "it can return every customer" do
    get :index, format: :json
    assert_response :success
  end

  test "it can return a customer's invoices" do
    get :invoices, { 'customer_id' => '3' }, format: :json
    assert_response :success
  end

  test "it can return a customer's transactions" do
    get :transactions, { 'customer_id' => '2' }, format: :json
    assert_response :success
  end
end
