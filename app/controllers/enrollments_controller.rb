class EnrollmentsController < ApplicationController
  before_action :set_program, only: [:index, :show, :edit, :update, :destroy ]
  
  def index
    # Fetch the program information based on the program_id passed in the URL params
    @program = Program.find(params[:program_id])

    # Retrieve the enrollments for this program (you can customize this part based on your requirements)
    # @enrollments = Enrollment.where(program_id: @program.id)
  end

  def show
  end

  def new
    @student = Student.find(params[:student_id])
    @program_id = session[:program_id] # Retrieve program ID from session
    @enrollment = Enrollment.new
  
    
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    # Set the initial status to "pending"
    @enrollment.status = "pending"
  
    if @enrollment.save
      # Handle successful enrollment creation (e.g., display a success message)
    else
      # Handle enrollment creation errors and display error messages
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_program
    @program = Program.find(params[:program_id])
  end
end