class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    count = InvoiceItem.count -1
    render json: InvoiceItemSerializer.new(InvoiceItem.find(rand 0..count))
  end

end
