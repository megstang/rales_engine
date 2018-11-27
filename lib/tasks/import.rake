require 'csv'

namespace :import do

  task merchants: :environment do
    file = './db/data/merchants.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        merchant = Merchant.create!(row.to_h)
        count += 1 if merchant.persisted?
      end
    puts "Imported #{count} merchants."
  end

  task customers: :environment do
    file = './db/data/customers.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        customer = Customer.create!(row.to_h)
        count += 1 if customer.persisted?
      end
    puts "Imported #{count} customers."
  end

  task items: :environment do
    file = './db/data/items.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        item = Item.create!(row.to_h)
        count += 1 if item.persisted?
      end
    puts "Imported #{count} items."
  end

  task invoices: :environment do
    file = './db/data/invoices.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        invoice = Invoice.create!(row.to_h)
        count += 1 if invoice.persisted?
      end
    puts "Imported #{count} invoices."
  end

  task transactions: :environment do
    file = './db/data/transactions.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        transaction = Transaction.create!(row.to_h)
        count += 1 if transaction.persisted?
      end
    puts "Imported #{count} transactions."
  end

  task invoice_items: :environment do
    file = './db/data/invoice_items.csv'
    count = 0
      CSV.foreach(file,headers: true) do |row| #header_converters: :symbol <= include this in parentheses?
        invoice_item = InvoiceItem.create!(row.to_h)
        count += 1 if invoice_item.persisted?
      end
    puts "Imported #{count} invoice items."
  end

end
