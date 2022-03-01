class Setting::LineMessagingApiSetting < ApplicationRecord
  require 'net/http'
  acts_as_tenant(:store)

  validate :token_verify

  def token_verify
    uri = URI.parse('https://api.line.me/v2/oauth/verify')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === 'https'
    post_req = Net::HTTP::Post.new(uri.path)
    post_req['Content-Type'] = 'application/x-www-form-urlencoded'
    post_req.set_form_data({ 'access_token' => self.channel_access_token })
    response = http.request(post_req)

    if response.code == '200'
      res = JSON.parse(response.body, symbolize_names: true)

      self.client_id = res[:client_id]
      self.expire_at = Time.now + res[:expires_in].to_i
      self.scope = res[:scope]
    else
      errors.add(:channel_access_token, '連携先サイトからの情報取得に失敗しました')
    end
  end
end
