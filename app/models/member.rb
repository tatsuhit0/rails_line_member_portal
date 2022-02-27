class Member < ApplicationRecord
  acts_as_tenant(:store)
end
