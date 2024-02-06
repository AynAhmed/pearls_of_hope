class ItemsController < ApplicationController

    def show
        @program = Program.find(params[:id])

    end

    def new
        @program = Program.new
    end

    def create
        @coursework = current_user.courseworks.build(coursework_params) 
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

    def edit
    end



  
end
