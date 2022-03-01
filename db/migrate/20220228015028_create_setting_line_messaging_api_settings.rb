class CreateSettingLineMessagingApiSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :setting_line_messaging_api_settings do |t|
      t.references :store, index: true, foreign_key: true
      t.string :channel_access_token
      t.string :client_id
      t.string :scope
      t.datetime :expire_at
      t.timestamps
    end
  end
end
