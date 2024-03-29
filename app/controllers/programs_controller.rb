class ProgramsController < ApplicationController

    before_action :set_program, only: [:show, :edit, :update, :destroy, :signup,:create_checkout_session]
    

    def index
      @programs = Program.all
    end

    def show
      @program = Program.find(params[:id])
      # Assuming each program has an associated product
      @product = @program.product
      # Assuming you already have a method to initialize the cart

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


    def create_checkout_session
      session = Stripe::Checkout::Session.create({
      line_items: [
        {
        price: 'price_1OdLxGGFI1uaMnOfvgWU6leH',
        quantity: 1,
       }
      ],
      mode:'subscription',
      success_url: checkout_success_url(@program),
      cancel_url: program_url(@program)

      })
      redirect_to session.url, allow_other_host: true, status: 303
    end


    private

    def set_program
      @program = Program.find(params[:id])
      session[:program_id] = @program.id
    rescue ActiveRecord::RecordNotFound
      # Handle the case where the program is not found
      redirect_to programs_path, alert: 'Program not found'
    end


    def program_params
      params.require(:program).permit(:name, :description, :program_type, :age_group, :date, :image)
    end

    #creating  product
  end
  def unenroll
    program = Program.find(params[:program_id]) 
    enrollment = current_user.enrollments.find_by(program_id: program.id)
    
    redirect_to 'https://docs.google.com/forms/d/1JP0rOHR7vd9LmRwhN2UOS4tv9fpJIEjmiNxjWzjHJa4/viewform?edit_requested=true'
  end
