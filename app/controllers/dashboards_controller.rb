class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @students = Student.all
    @user = current_user
    @coursework = Coursework.new if instructor?
  end
end
