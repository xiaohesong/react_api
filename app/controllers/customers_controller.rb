class CustomersController < ApplicationController
  include ActionController::MimeResponds

  def index
    result = Customer.all.ransack(params[:q]).result.order("id asc")
    @customers = result.page(params[:page])
    respond_to do |format|
      format.csv { send_data csv_garbled(result.to_csv), filename: "绑定信息解锁/锁定记录-#{Date.today}.csv" }
      format.json {respond_with @customers, location: nil}
    end
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
