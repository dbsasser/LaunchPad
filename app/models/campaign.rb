class Campaign < ApplicationRecord
  belongs_to :user
  has_many :donations
  has many :users, through: :donations
end
