class Campaign < ApplicationRecord
  belongs_to :user
  has_many :donations
  has_many :users, through: :donations
end
