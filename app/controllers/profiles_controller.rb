class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @profiles = User.all 
    end

    def new
        @user = User.new
    end
      
    def show
        @user = current_user
        redirect_to root_path, alert: 'You need to sign in' unless @user
    end
  
    def edit
      @user = current_user
    end

    def full_name
        "#{first_name} #{last_name}"
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Profile updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :programs, :role)
    end
  end