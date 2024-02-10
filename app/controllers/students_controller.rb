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
      @student.user = current_user 
      @student = current_user.students.build(student_params)


      # Assuming you have a way to determine the program based on program_id

      if @student.save

        redirect_to new_enrollment_path, status: :see_other, notice: "You just created a student! Congrats!"
      else
        puts @student.errors.full_messages # Add this line for debugging
        render :new
      end
    end


    def edit

    end

    def update
      if @student.update(student_params)
        redirect_to enrollments_path, notice: 'Student was successfully updated.'
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
      session[:student_id] = @student.id
    rescue ActiveRecord::RecordNotFound
      # Handle the case where the program is not found
      redirect_to programs_path, alert: 'Student not found'
    end

    def student_params
        params.require(:student).permit(:first_name, :last_name, :dob, :user_id) # Make sure to use a symbol for :user_id
      end
  end
