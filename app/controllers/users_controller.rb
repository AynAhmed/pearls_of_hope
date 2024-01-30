class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      if @user.save
        send_thank_you_email(@user.email)
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def send_thank_you_email(user_email)
      message = Mailjet::Send.create(messages: [{
        'From'=> {
          'Email'=> 'your@email.com', # Your email address
          'Name'=> 'Your Name'
        },
        'To'=> [{
          'Email'=> user_email,
          'Name'=> 'User'
        }],
        'Subject'=> 'Thank you for signing up!',
        'TextPart'=> 'Thank you for signing up to our website.'
      }])
    end
  
    def user_params
      params.require(:user).permit(:email, :name) 
    end
  end
  