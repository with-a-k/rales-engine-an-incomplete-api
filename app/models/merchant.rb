class Merchant < ActiveRecord::Base
  default_scope { order('id DESC') }
  has_many :items
  has_many :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price").to_f
  end

  def revenue_on_date(date)
    invoices.on_date(date).joins(:invoice_items).sum("quantity * unit_price").to_f
  end

  def favorite_customers_id
    invoices.successful.group_by(customer_id).max_by {|customer_id| customer_id.length}
  end

  def pending
    invoices.pending.joins(:invoice_items).pluck('customer_id').uniq
  end
end
