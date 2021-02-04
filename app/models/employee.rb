class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # belongs_to :restaurant
  acts_as_tenant :restaurant

  scope :manager, -> { where(role: 'manager') }
end
