class Api::V1::Merchants::RandomController < ApplicationController

  def show
    count = Merchant.count -1
    render json: Merchant.find(rand 0..count)
  end
end
