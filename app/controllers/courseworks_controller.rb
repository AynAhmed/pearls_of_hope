class CourseworksController < ApplicationController
    before_action :set_program

  def show
    @courseworks = @program.courseworks
  end

  private

  def set_program

    @program = Program.find_by(name: params[:program])
    
    redirect_to root_path, alert: 'Program not found' unless @program
  end
end
end
