class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price.to_f/100) as revenue')
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

  def total_revenue(date_or_default = {})
    if date_or_default = {}
      invoices
      .joins(:transactions)
      .joins('join invoice_items on invoice_items.invoice_id = invoices.id')
      .where(transactions: {result: "success"})
      .sum('invoice_items.unit_price * invoice_items.quantity')
    else
      invoices
      .joins(:transactions)
      .joins('join invoice_items on invoice_items.invoice_id = invoices.id')
      .where(transactions: {result: "success"})
      .where('invoices.created_at LIKE ?', date_or_default[:created_at])
      .sum('invoice_items.unit_price * invoice_items.quantity')
    end
    #  binding.pry
    # invoices
    #  .joins(:transactions, :invoice_items)
    #  .where(transactions: {result: "success"})
    #  .where(date_or_default)
    #  .sum('invoice_items.unit_price * invoice_items.quantity')
  end

end
