class Api::V1::Customers::MerchantsController < ApplicationController
  def show
    merchant = Customer.find(params[:id]).favorite_merchant
    render json: MerchantSerializer.new(merchant)
  end
end
