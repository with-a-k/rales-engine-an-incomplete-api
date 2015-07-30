class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params['id'])
  end

  def random
    respond_with Item.all.sample
  end

  def invoice_items
    respond_with Item.find_by(id: params['item_id']).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params['item_id']).merchant
  end

  def find
    respond_with Item.find_by(find_param)
  end

  def find_all
    respond_with Item.where(find_param)
  end

  def by_revenue
    params['quantity'] ||= 1
    items_by_revenue = Item.all.sort_by{|item| item.total_revenue}
    respond_with items_by_revenue.first(params['quantity'])
  end

  def by_items
    params['quantity'] ||= 1
    items_by_quantity = Item.all.sort_by{|item| item.quantity_sold}
    respond_with items_by_quantity.first(params['quantity'])
  end

  private

  def find_param
    attributes = %w(id merchant_id name description unit_price created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
