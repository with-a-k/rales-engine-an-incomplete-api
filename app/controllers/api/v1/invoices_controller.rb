class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params['id'])
  end

  def random
    respond_with Invoice.all.sample
  end

  def invoice_items
    respond_with Invoice.find_by(id: params['invoice_id']).invoice_items
  end

  def items
    respond_with Invoice.find_by(id: params['invoice_id']).items
  end

  def transactions
    respond_with Invoice.find_by(id: params['invoice_id']).transactions
  end

  def merchant
    respond_with Invoice.find_by(id: params['invoice_id']).merchant
  end

  def customer
    respond_with Invoice.find_by(id: params['invoice_id']).customer
  end

  def find
    respond_with Invoice.find_by(find_param)
  end

  def find_all
    respond_with Invoice.where(find_param)
  end

  private

  def find_param
    attributes = %w(id customer_id merchant_id status created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
