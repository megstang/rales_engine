class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    select('items.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
    .joins(:invoice_items)
    .joins('join transactions on invoice_items.invoice_id = transactions.invoice_id')
    .group(:id)
    .limit(quantity)
  end

  def self.most_items(quantity)
     select('items.*, sum(invoice_items.quantity) as item_quant')
     .joins(:invoice_items, :transactions )
     .group(:id)
     .where(transactions: {result: 'success'})
     .order('item_quant desc')
     .limit(quantity)
   end
end
