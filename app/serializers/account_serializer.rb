class AccountSerializer < ActiveModel::Serializer
  attributes :id
  has_many :stores
end
