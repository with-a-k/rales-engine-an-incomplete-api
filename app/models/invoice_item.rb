class InvoiceItem < ActiveRecord::Base
  default_scope { order('id DESC') }
  def self.successful
    # where(Invoice.find_by(invoice_id).status == 'shipped')
  end
  belongs_to :item
  belongs_to :invoice
end
