class Attendance < ApplicationRecord
  # after_create :subscription_send

  belongs_to :event
  belongs_to :guest, class_name: "User"

  def subcription_send
    UserMailer.welcome_event(self).deliver_now
  end
end
