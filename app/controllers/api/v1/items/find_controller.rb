class Api::V1::Items::FindController < ApplicationController

  def show
    if params[:unit_price]
      unit_price = convert_to_cents(params[:unit_price])
      render json: ItemSerializer.new(Item.find_by(unit_price: unit_price))
    else
      render json: ItemSerializer.new(Item.find_by(strong_params))
    end
  end

  def index
    render json: ItemSerializer.new(Item.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id, :name,:description,:unit_price,:merchant_id , :created_at, :updated_at)
  end

  def convert_to_cents(unit_price_string)
    (unit_price_string.gsub("\"", "").to_f * 100).round
  end
end
