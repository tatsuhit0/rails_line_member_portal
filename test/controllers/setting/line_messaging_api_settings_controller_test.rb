require "test_helper"

class Setting::LineMessagingApiSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting_line_messaging_api_setting = setting_line_messaging_api_settings(:one)
  end

  test "should get index" do
    get setting_line_messaging_api_settings_url, as: :json
    assert_response :success
  end

  test "should create setting_line_messaging_api_setting" do
    assert_difference('Setting::LineMessagingApiSetting.count') do
      post setting_line_messaging_api_settings_url, params: { setting_line_messaging_api_setting: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show setting_line_messaging_api_setting" do
    get setting_line_messaging_api_setting_url(@setting_line_messaging_api_setting), as: :json
    assert_response :success
  end

  test "should update setting_line_messaging_api_setting" do
    patch setting_line_messaging_api_setting_url(@setting_line_messaging_api_setting), params: { setting_line_messaging_api_setting: {  } }, as: :json
    assert_response 200
  end

  test "should destroy setting_line_messaging_api_setting" do
    assert_difference('Setting::LineMessagingApiSetting.count', -1) do
      delete setting_line_messaging_api_setting_url(@setting_line_messaging_api_setting), as: :json
    end

    assert_response 204
  end
end
