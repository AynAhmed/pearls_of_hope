class AboutController < ApplicationController

  def index
    
  end

  def show
  end

  def new
      @about = About.new
    end
  
  def create
      @about = About.new(program_params)
  
  if @about.save
      redirect_to @about, notice: 'About was successfully created.'
  else
      render :new
  end
  end

end
