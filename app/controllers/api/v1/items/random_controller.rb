class Api::V1::Items::RandomController < ApplicationController

  def show
    count = Item.count -1
    render json: ItemSerializer.new(Item.find(rand 0..count))
  end

end
