class Api::V1::Customers::FindController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.find_by(strong_params))
  end

  def index
    render json: CustomerSerializer.new(Customer.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
