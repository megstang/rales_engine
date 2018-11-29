class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price/100) as revenue')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 'success'})
    .group(:id)
    .order('revenue desc')
    .limit(quantity)
  end

  def self.most_items(quantity)
    select('merchants.*, invoice_items.count as items_sold')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order('items_sold desc')
    .limit(quantity)
  end
end
