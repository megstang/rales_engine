class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(strong_params))
  end

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
