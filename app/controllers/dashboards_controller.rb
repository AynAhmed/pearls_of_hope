class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @students = current_user.students
    @user = current_user
    @coursework = Coursework.new if instructor?

    @payments = Payment.where(user_id: current_user.id)
    @purchased_programs = {}

    @payments.each do |payment|
      program_ids = payment.program_ids.split(',').map(&:to_i)
      program_ids.each do |program_id|
        program = Program.find_by(id: program_id)
        @purchased_programs[program.name] = program.id if program
      end
    end
  end

  def students
    @user = current_user
    @students = current_user.students
  end
end
