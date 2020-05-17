class Campaign < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
  has_many :donations
  has_many :users, through: :donations
  has_many :comments
  has_rich_text :description
  validates :title, length: { in: 5..75} 
  validates :picture, presence: true
  validates :goal, numericality: { only_integer: true, greater_than: 0 }
  validates :creator_id, presence: true

  def percent_raised
    if self.goal > 0 && self.donations.sum(:amount) > 0
      (self.donations.sum(:amount) * 100) / self.goal
    else
      0
    end
  end

end
