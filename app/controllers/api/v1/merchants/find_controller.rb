class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_by(strong_params))
  end

  def index
    render json: MerchantSerializer.new(Merchant.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id,:name,:created_at,:updated_at)
  end
end
