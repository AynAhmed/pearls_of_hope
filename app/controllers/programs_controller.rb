class ProgramsController < ApplicationController
    before_action :set_program, only: [:show, :edit, :update, :destroy, :signup]
  
    def index
      @programs = Program.all
    end
  
    def show
    end
    def new
        @program = Program.new
      end
    
    def create
        @program = Program.new(program_params)
    
    if @program.save
        redirect_to @program, notice: 'Program was successfully created.'
    else
        render :new
    end
    end
    def edit
    end
  
    def update
      if @program.update(program_params)
        redirect_to @program, notice: 'Program was successfully updated.'
      else
        render :edit
      end
    end  
  
    def signup
      # Implement signup logic here
      # You might want to associate the user with the program or perform other actions
      # For simplicity, let's assume a simple flash message for successful signup
      flash[:notice] = 'Signed up for the program!'
      redirect_to @program
    end

    def destroy
        @program.destroy
        redirect_to programs_url, notice: 'Program was successfully destroyed.'
    end
      
  
    private
  
    def set_program
      @program = Program.find(params[:id])
    end
  
    def program_params
      # Replace 'type' with a different attribute name if not using Single Table Inheritance
      params.require(:program).permit(:name, :description, :type, :age_group, :date)
    end
  end
  