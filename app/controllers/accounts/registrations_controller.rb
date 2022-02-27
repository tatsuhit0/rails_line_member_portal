class Accounts::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super { |resource| }
  end

  def render_create_success
    account = Account.find(@resource.id)
    render json: account
  end

  def render_update_success
    render json: @resource
  end

  protected

  def sign_up_params
    params.permit(
      :email,
      :password,
      stores_attributes: [:name],
      account_stores_attributes: %i[id store_id]
    )
  end
end
