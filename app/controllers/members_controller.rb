class MembersController < ApplicationController
  set_current_tenant_through_filter
  before_action :authenticate_account!
  before_action :set_tenant
  before_action :set_member, only: %i[show update destroy]

  # GET /members
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private

  def set_tenant
    if request.headers[:HTTP_X_ACCOUNT_ID].blank?
      render json: { 'errors' => { 'account' => ['アカウント選択エラー'] } }, status: 401
      return nil
    end
    tenant = current_account.stores.exists?(request.headers[:HTTP_X_ACCOUNT_ID])

    if current_account.stores.exists?(request.headers[:HTTP_X_ACCOUNT_ID])
      set_current_tenant(current_account.stores.find(request.headers[:HTTP_X_ACCOUNT_ID]))
    else
      render json: { 'errors' => { 'account' => ['アカウント選択エラー'] } }, status: 401
      return nil
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params
      .fetch(:member, {})
      .permit(:code, :last_name, :first_name, :email, :tel1, :zip, :address1, :address2)
  end
end
