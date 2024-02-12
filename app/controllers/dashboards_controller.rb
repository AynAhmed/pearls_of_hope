class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @students = current_user.students
    @user = current_user
    @coursework = Coursework.new if instructor?
  end

  def students
    # Logic to fetch and display students enrolled in programs
    @user = current_user
    @students = current_user.students # Assuming you have a method to fetch students for the current user
  end
end
