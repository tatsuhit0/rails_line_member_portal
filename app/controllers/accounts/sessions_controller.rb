class Accounts::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super { |resource| }
  end

  def render_create_success
    account = Account.find(@resource.id)
    render json: account
  end
end
