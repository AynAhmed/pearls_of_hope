ActiveAdmin.register User do

  permit_params :first_name, :last_name, :phone_number, :email, :password, :role # Add other fields you want to permit

  actions :index, :show, :update, :edit, :destroy

  permit_params :first_name, :last_name, :phone_number, :email, :role_id


  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email

    column :role
    # Add other columns as needed

    column :role_id

    actions
  end

 
  filter :email

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone_number
      f.input :email

      f.input :role, as: :select, collection: ['default', 'instructor'], include_blank: false


      # Do not include password unless you want admins to be able to reset it
      f.input :role_id

    end
    f.actions
  end

  # Override the actions to remove the ability to create new users
  actions :index, :show, :update, :destroy

  # Customizes the controller actions
  controller do
    # Override the new action
    def new
      flash[:alert] = "Creating new users is not allowed."
      redirect_to collection_path
    end

    # Override the create action
    def create
      flash[:alert] = "Creating new users is not allowed."
      redirect_to collection_path
    end
  end
end
