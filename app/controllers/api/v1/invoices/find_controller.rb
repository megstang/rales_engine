class Api::V1::Invoices::FindController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(strong_params))
  end

  def index
    render json: InvoiceSerializer.new(Invoice.where(strong_params))
  end

  private

  def strong_params
    params.permit(:id, :customer_id, :merchant_id, :status , :created_at, :updated_at)
  end
end
