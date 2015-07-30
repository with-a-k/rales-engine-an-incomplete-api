class Invoice < ActiveRecord::Base
  default_scope { order('id DESC') }
  def self.successful
    where(status: 'shipped')
  end

  def self.on_date(date)
    where(created_at: date)
  end

  def self.pending
    where(status: 'pending')
  end
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
end
