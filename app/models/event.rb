class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  
  validates :start_date, presence: true, if: :future_date
  validates :duration, presence: true, if: :divisible_by_five
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true

  def future_date
    start_date > Date.today
  end
  def divisible_by_five
    duration % 5 == 0
  end
end
