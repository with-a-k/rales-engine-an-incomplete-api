require 'smarter_csv'
options = {}

namespace :db do
  desc "Take data from CSV files and populate the database"
  task :import => [:import_customers, :import_merchants, :import_invoices,
                   :import_items, :import_invoice_items, :import_transactions] do
    
  end

  task import_customers: :environment do
    SmarterCSV.process("./test/fixtures/data/customers.csv", options) do |chunk|
      chunk.each do |data_hash|
        Customer.create!(data_hash)
      end
    end
  end

  task import_merchants: :environment do
    SmarterCSV.process("./test/fixtures/data/merchants.csv", options) do |chunk|
      chunk.each do |data_hash|
        Merchant.create!(data_hash)
      end
    end
  end

  task import_invoices: :environment do
    SmarterCSV.process("./test/fixtures/data/invoices.csv", options) do |chunk|
      chunk.each do |data_hash|
        Invoice.create!(data_hash)
      end
    end
  end

  task import_items: :environment do
    SmarterCSV.process("./test/fixtures/data/items.csv", options) do |chunk|
      chunk.each do |data_hash|
        Item.create!(data_hash)
      end
    end
  end

  task import_invoice_items: :environment do
    SmarterCSV.process("./test/fixtures/data/invoice_items.csv", options) do |chunk|
      chunk.each do |data_hash|
        InvoiceItem.create!(data_hash)
      end
    end
  end

  task import_transactions: :environment do
    SmarterCSV.process("./test/fixtures/data/transactions.csv", options) do |chunk|
      chunk.each do |data_hash|
        Transaction.create!(data_hash)
      end
    end
  end
end
