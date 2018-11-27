class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: Merchant.where(strong_params)
  end

  private

  def strong_params
    params.permit(:id,:name,:created_at,:updated_at)
  end
end
