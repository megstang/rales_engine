class Api::V1::Transactions::RandomController < ApplicationController

  def show
    count = Transaction.count -1
    render json: TransactionSerializer.new(Transaction.find(rand 0..count))
  end

end
