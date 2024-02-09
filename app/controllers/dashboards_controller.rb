class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @students = current_user.students
    @user = current_user
    @coursework = Coursework.new if instructor?
  end
end
