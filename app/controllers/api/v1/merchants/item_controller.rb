class Api::V1::Merchants::ItemController < ApplicationController

  def index
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end
  
end
