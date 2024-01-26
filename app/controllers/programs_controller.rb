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
      flash[:notice] = 'Signed up for the program!'
      redirect_to @program
    end

    def destroy
        @program.destroy
        redirect_to programs_url, notice: 'Program was successfully destroyed.'
    end
      
  
    private
  
    def set_program
      @program = Program.find_by(name: params[:id])
    end
  
    def program_params
      params.require(:program).permit(:name, :description, :program_type, :age_group, :date)
    end
  end
