class Api::V1::Items::BestDayController < ApplicationController
  def show
    best_day = Item.find(params[:id]).best_day
    render json: {data: {attributes: {best_day: best_day}}}.to_json

  end
end
