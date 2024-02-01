class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
      @students = Student.all
      @user = current_user
    end
  
    def show
     
    end
  
    def new
      @student = Student.build
    end
  
    def create
      @student = current_user.students.build(student_params)
      @student.user = current_user 
      if @student.save

        redirect_to @student, notice: 'Student was successfully created.'
      else
        puts @student.errors.full_messages # Add this line for debugging
        render :new
      end
    end
  
    def edit
     
    end
  
    def update
      if @student.update(student_params)
        redirect_to @student, notice: 'Student was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @student.destroy
      redirect_to students_url, notice: 'Student was successfully destroyed.'
    end
  
    private
  
    def set_student
      @student = Student.find(params[:id])
    end
  
    def student_params
        params.require(:student).permit(:first_name, :last_name, :dob, :program_id, :user_id) # Make sure to use a symbol for :user_id
      end      
  end
  