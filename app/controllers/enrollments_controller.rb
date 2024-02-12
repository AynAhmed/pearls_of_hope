class EnrollmentsController < ApplicationController
  before_action :set_program, only: [:index, :show, :edit, :update, :destroy ]
  before_action :authenticate_user!
  def index
    # Fetch the program information based on the program_id passed in the URL params
    @program = Program.find(params[:program_id])
    @students = current_user.students
    # Retrieve the enrollments for this program (you can customize this part based on your requirements)
    # @enrollments = Enrollment.where(program_id: @program.id)
  end

  def show
  end


  def new
    @students = current_user.students
    puts "@students: #{@students.inspect}" # A
    @program_id = params[:program_id] # Retrieve program ID from session or wherever it's stored
    @enrollment = Enrollment.new
  end
  



    def create
      @enrollment = Enrollment.new(enrollment_params)
      # Set the initial status to "pending"
      @enrollment.status = "pending"
    
      # Fetch the program and student
      @program = Program.find(params[:enrollment][:program_id])
      @student = Student.find(params[:enrollment][:student_id])
    
      # Ensure that the user has a cart; create one if it doesn't exist
      if @enrollment.save
        redirect_to cart_path, status: :see_other, notice: "You just enrolled a student! Congrats!"
      else
        render :new
      end
    end
    
    # if @enrollment.save

    # # Create a CartProduct record using the product_id from the program
    # # and the student_id from the enrollment
    # product = Product.find_by(program_id: @program.id)
    # current_user.cart.cart_products.create(product: product, student: @student)


    #   session[:cart_data] = {
    #   program_id: @program.id,
    #   student_id: @student.id
    #  }
    #  redirect_to new_cart_product_path, status: :see_other, notice: "You just enrolled a student! Congrats!"

    #   # Handle successful enrollment creation (e.g., display a success message)
    # else
    #   # Handle enrollment creation errors and display error messages
    # end
\

  def edit
  end

  def update
  end

  def destroy
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    current_user.cart.products << product
    # redirect_to view_cart_path, notice: 'Product added to cart'
  end

  private
  def set_program
    @program = Program.find(params[:program_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:program_id, :student_id, :status)
  end


end