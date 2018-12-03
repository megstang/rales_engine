class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    if params[:unit_price]
      unit_price = convert_to_cents(params[:unit_price])
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(unit_price: unit_price))

    else
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(strong_params))
    end
  end

  def index
    if params[:unit_price]
      unit_price = convert_to_cents(params[:unit_price])
      render json: InvoiceItemSerializer.new(InvoiceItem.where(unit_price: unit_price))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.where(strong_params))
    end
  end

  private

  def strong_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

  def convert_to_cents(unit_price_string)
    (unit_price_string.gsub("\"", "").to_f * 100).round
  end
end
