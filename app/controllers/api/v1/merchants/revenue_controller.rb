class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.most_revenue(params[:quantity].to_i)
  end

  def show
      revenue = Merchant.find(params[:id]).total_revenue(search_query)
      render json: revenue.to_f/100
  end


  private

  def search_query
    if params[:date]
      date = Date.parse(params[:date])
      {created_at: params[:date]}
    end
  end

end
