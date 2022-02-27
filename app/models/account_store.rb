class AccountStore < ApplicationRecord
  belongs_to :account
  belongs_to :store
end
