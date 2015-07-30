class Item < ActiveRecord::Base
  default_scope { order('id DESC') }
  belongs_to :merchant
  has_many :invoice_items

  def total_revenue
    invoice_items.successful.sum("quantity * unit_price").to_f
  end

  def total_quantity
    invoice_items.successful.sum("quantity")
  end
end
