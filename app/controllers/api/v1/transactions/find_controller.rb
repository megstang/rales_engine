class Api::V1::Transactions::FindController < ApplicationController

  def show
    render json: TransactionSerializer.new(Transaction.find_by(strong_params))
  end

  def index
    render json: TransactionSerializer.new(Transaction.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id,:invoice_id,:credit_card_number,:credit_card_expiration_date,:result,:created_at,:updated_at)
  end
end
