class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params['id'])
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def invoice
    respond_with InvoiceItem.find_by(id: params['invoice_item_id']).invoice
  end

  def item
    respond_with InvoiceItem.find_by(id: params['invoice_item_id']).item
  end

  def find
    respond_with InvoiceItem.find_by(find_param)
  end

  def find_all
    respond_with InvoiceItem.where(find_param)
  end

  private

  def find_param
    attributes = %w(id invoice_id item_id quantity unit_price created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
