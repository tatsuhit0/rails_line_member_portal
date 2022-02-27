# frozen_string_literal: true

class Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :account_stores, dependent: :destroy
  has_many :stores, through: :account_stores
  accepts_nested_attributes_for :stores
  accepts_nested_attributes_for :account_stores
end
