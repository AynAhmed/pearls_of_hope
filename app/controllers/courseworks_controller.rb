class CourseworksController < ApplicationController
  before_action :set_program, only: [ :create, :new, :show,:edit, :update, :destroy]
  before_action :set_coursework, only: [ :create, :show, :edit, :update, :destroy] 


  def index
    @courseworks = @student.program.courseworks
  end


  def new
    @coursework = @program.courseworks.build

  end

  def show
    @coursework = Coursework.find(params[:id])
  end

  def create
    @user = User.ids
    @coursework = @program.courseworks.build(coursework_params) 
  # Handle file uploads
  if params[:coursework][:attachments].present?
    params[:coursework][:attachments].each do |attachment|
      @coursework.attachments.attach(attachment)
    end
  end


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
    @program = Program.find(params[:item_id])
  end

  def set_coursework
    @coursework = Coursework.find(params[:id]) if params[:id].present?
  end

  def coursework_params
    params.require(:coursework).permit(:name, :description, :program_id, :user_id)
  end
end