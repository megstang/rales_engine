class Api::V1::Customers::RandomController < ApplicationController

  def show
    count = Customer.count -1
    render json: CustomerSerializer.new(Customer.find(rand 0..count))
  end

end
