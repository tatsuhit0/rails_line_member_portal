class Setting::LineMessagingApiSettingsController < ApplicationController
  set_current_tenant_through_filter
  before_action :authenticate_account!
  before_action :set_tenant
  before_action :set_setting_line_messaging_api_setting, only: %i[show update destroy]

  # GET /setting/line_messaging_api_settings
  def index
    @setting_line_messaging_api_settings =
      Setting::LineMessagingApiSetting.find_by(store_id: @current_tenant.id)

    render json: @setting_line_messaging_api_settings
  end

  # GET /setting/line_messaging_api_settings/1
  # def show
  #   render json: @setting_line_messaging_api_setting
  # end

  # POST /setting/line_messaging_api_settings
  def create
    @setting_line_messaging_api_setting =
      Setting::LineMessagingApiSetting.find_or_initialize_by(store_id: @current_tenant.id)

    @setting_line_messaging_api_setting.update(setting_line_messaging_api_setting_params)

    # if @setting_line_messaging_api_setting.save
    #   render json: @setting_line_messaging_api_setting,
    #          status: :created,
    #          location: @setting_line_messaging_api_setting
    # else
    #   render json: @setting_line_messaging_api_setting.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /setting/line_messaging_api_settings/1
  # def update
  #   if @setting_line_messaging_api_setting.update(setting_line_messaging_api_setting_params)
  #     render json: @setting_line_messaging_api_setting
  #   else
  #     render json: @setting_line_messaging_api_setting.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /setting/line_messaging_api_settings/1
  # def destroy
  #   @setting_line_messaging_api_setting.destroy
  # end

  private

  def set_tenant
    if request.headers[:HTTP_X_ACCOUNT_ID].blank?
      render json: { 'errors' => { 'account' => ['アカウント選択エラー'] } }, status: 401
      return nil
    end

    if current_account.stores.exists?(request.headers[:HTTP_X_ACCOUNT_ID])
      @current_tenant = current_account.stores.find(request.headers[:HTTP_X_ACCOUNT_ID])
      set_current_tenant(@current_tenant)
    else
      render json: { 'errors' => { 'account' => ['アカウント選択エラー'] } }, status: 401
      return nil
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_setting_line_messaging_api_setting
    @setting_line_messaging_api_setting = Setting::LineMessagingApiSetting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def setting_line_messaging_api_setting_params
    params.fetch(:setting_line_messaging_api_setting, {}).permit(:channel_access_token)
  end
end
