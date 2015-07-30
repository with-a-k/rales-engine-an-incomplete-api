class RemoveCreditCardExpirationDateFromTransactions < ActiveRecord::Migration
  def change
    change_table :transactions do |t|
      t.remove :credit_card_expiration_date      
    end
  end
end
