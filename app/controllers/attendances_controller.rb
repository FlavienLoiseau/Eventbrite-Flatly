class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    Attendance.create(guest: current_user, event: @event, stripe_customer_id: "")
  end

  def destroy
    @attendance = Attendance.find(params[:id]).destroy
    redirect_to root_path
  end

end
