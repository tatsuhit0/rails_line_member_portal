class Store < ApplicationRecord
  has_many :account_stores, foreign_key: 'store_id'
  has_many :account, through: :account_stores
  belongs_to :setting_line_messaging_api_setting
end
