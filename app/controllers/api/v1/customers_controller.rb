class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params['id'])
  end

  def random
    respond_with Customer.all.sample
  end

  def invoices
    respond_with Customer.find_by(id: params['customer_id']).invoices
  end

  def transactions
    respond_with Customer.find_by(id: params['customer_id']).transactions
  end

  def find
    respond_with Customer.find_by(find_param)
  end

  def find_all
    respond_with Customer.where(find_param)
  end

  def favorite
    respond_with Merchant.find_by(id: Customer.find_by(id: params['customer_id']).favorite_merchant)
  end

  private

  def find_param
    attributes = %w(id first_name last_name created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
