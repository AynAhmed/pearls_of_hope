# app/controllers/subscribers_controller.rb

require 'gibbon'

  class SubscribersController < ApplicationController
    def create
      email = params[:email]
      list_id = 'c86b27916c'  # Replace 'your_list_id_here' with your actual Mailchimp list ID
  
      begin
        gibbon = Gibbon::Request.new
        gibbon.lists(list_id).members.create(body: { email_address: email, status: 'subscribed' })
  
        redirect_to root_path, notice: 'You have been subscribed to our newsletter!'
      rescue Gibbon::MailChimpError => e
        redirect_to root_path, alert: "Error subscribing: #{e.message}"
      end
    end
  end
  