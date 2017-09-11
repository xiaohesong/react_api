class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: {statue: 'ok'}
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.delete
    render json: {statue: 'ok'}
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render json: {status: 'ok'}
  end

  private
  def customer_params
    params.permit(
      :phone,
      :birth,
      :name,
      :address,
      :password,
      roleIds: []
    )
  end
end
