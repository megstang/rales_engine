class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .joins(:invoices, :transactions)
    .where(transactions: {result: 'success'})
    .group(:id)
    .order('count(invoices.id)')
    .last
  end
end
