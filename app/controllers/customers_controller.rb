class CustomersController < ApplicationController
  def index
    @customers = Customer.all.ransack(params[:q]).result.order("id asc").page(params[:page])
    # respond_with @customers, location: nil
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
