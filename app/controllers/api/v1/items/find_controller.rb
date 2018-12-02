class Api::V1::Items::FindController < ApplicationController

  def show
    render json: ItemSerializer.new(Item.find_by(strong_params))
  end

  def index
    render json: ItemSerializer.new(Item.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id, :name,:description,:unit_price,:merchant_id , :created_at, :updated_at)
  end
end
