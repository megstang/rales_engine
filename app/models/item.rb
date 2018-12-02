class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  def self.most_revenue(quantity)
    select('items.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
    .joins(:invoice_items)
    .joins('join transactions on invoice_items.invoice_id = transactions.invoice_id')
    .group(:id)
    .limit(quantity)
  end
end
