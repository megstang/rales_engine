class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    if params[:quantity]
      merchants = Merchant.most_revenue(params[:quantity].to_i)
      render json: MerchantSerializer.new(merchants)
    elsif params[:date]
      revenue = Merchant.merchants_revenue_by_date(search_query)
      render json: {data: {attributes: {revenue: revenue}}}.to_json
    end
  end

  def show
      merchant = Merchant.find(params[:id])
      result = merchant.total_revenue(search_query)
      revenue = Revenue.new(result)
      render json: {data: {attributes: {revenue: revenue}}}.to_json
  end


  private

  def search_query
    if params[:date]
      date = Date.parse(params[:date].gsub("\"", ""))
      {created_at: params[:date].gsub("\"", "")}
    end
  end

end
