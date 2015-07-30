class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params['id'])
  end

  def random
    respond_with Merchant.all.sample
  end

  def invoices
    respond_with Merchant.find_by(id: params['merchant_id']).invoices
  end

  def items
    respond_with Merchant.find_by(id: params['merchant_id']).items
  end

  def most_revenue
    respond_with Merchant.find
  end

  def find
    respond_with Merchant.find_by(find_param)
  end

  def find_all
    respond_with Merchant.where(find_param)
  end

  def by_revenue
    params['quantity'] ||= 1
    merchants_by_revenue = Merchant.all.sort_by{|merchant| merchant.total_revenue}
    respond_with merchants_by_revenue.first(params['quantity'])
  end

  def by_items
    params['quantity'] ||= 1
    merchants_by_items = Merchant.all.sort_by{|merchant| merchant.items.count}
    respond_with merchants_by_items.first(params['quantity'])
  end

  def revenue_for_date

    # respond_with 
  end

  def single_revenue
    respond_with Merchant.find_by(id: params['merchant_id']).total_revenue
  end

  def single_date_revenue
    respond_with Merchant.find_by(id: params['merchant_id']).revenue_for_date(params['date'])
  end

  def favorite
    respond_with Customer.find_by(id: Merchant.find_by(params['merchant_id'].favorite))
  end

  def pending
    respond_with Merchant.find_by(id: params['merchant_id']).pending
  end

  private

  def find_param
    attributes = %w(id name created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
