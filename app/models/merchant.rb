class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
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

  def self.merchants_revenue_by_date(date)
    select('merchants.*')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 'success'})
    .pluck('sum(invoice_items.quantity * invoice_items.unit_price)')
    .sum
  end

  def total_revenue(date_or_default = {})
    if date_or_default = {}
      no_date_provided
    else
      date_provided
    end
  end

  def date_provided
    invoices
    .joins(:transactions)
    .joins('join invoice_items on invoice_items.invoice_id = invoices.id')
    .where(transactions: {result: "success"})
    .where('invoices.created_at LIKE ?', date_or_default[:created_at])
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def no_date_provided
    invoices
    .joins(:transactions)
    .joins('join invoice_items on invoice_items.invoice_id = invoices.id')
    .where(transactions: {result: "success"})
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def favorite_customer
    customers
    .joins(:transactions)
    .where(transactions: {result: 'success'})
    .group(:id)
    .order("count(customers.id)")
    .last
  end



end
