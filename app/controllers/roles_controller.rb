class RolesController < ApplicationController
  respond_to :json

  def index
    @roles = Role.all
    respond_with @roles, location: nil
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      render json: 'ok'
    end
  end

  def update
    @role = Role.find(params[:id])
    @role.update(role_params)
    render json: 'ok'
  end

  private
  def role_params
    params.permit(
      :name,
      permission: []
    )
  end
end
