class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.most_items(params[:quantity].to_i))
    # if params[:quantity]
    #   merchants = Merchant.most_revenue(params[:quantity].to_i)
    #   render json: MerchantSerializer.new(merchants)
    # elsif params[:date]
    #   revenue = Merchant.merchants_revenue_by_date(search_query)
    #   render json: {data: {attributes: {revenue: revenue}}}.to_json
    # end
  end

end
