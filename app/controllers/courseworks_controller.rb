class CourseworksController < ApplicationController
  before_action :set_program, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_program, only: [:new, :create, :edit, :update, :destroy] 


  def index
  end


  def new
    @coursework = Coursework.new
  end

  def create
    @coursework = current_user.courseworks.build(coursework_params) # Use 'build' instead of 'create'
    puts "Received params: #{params.inspect}"

    respond_to do |format|
      if @coursework.save
        format.html { redirect_to dashboards_index_path }
      else
        puts "Errors: #{@coursework.errors.full_messages.inspect}"
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /coursework/1/edit
  def edit
  end


  def update
    if @coursework.update(coursework_params)
      redirect_to program_path(@program), notice: 'Coursework was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @coursework.destroy
    redirect_to program_path(@program), notice: 'Coursework was successfully deleted.'
  end


  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_coursework
    @coursework = Coursework.find(params[:id])
  end

  def coursework_params
    params.require(:coursework).permit(:name, :description, :content, :program_id)
  end
end