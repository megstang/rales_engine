class Api::V1::Invoices::RandomController < ApplicationController

  def show
    count = Invoice.count -1
    render json: InvoiceSerializer.new(Invoice.find(rand 0..count))
  end

end
