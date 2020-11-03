class User < ApplicationRecord
  after_create :welcome_send

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
