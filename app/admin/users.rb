ActiveAdmin.register User do
  permit_params :first_name, :last_name, :phone_number, :email, :password, :role # Add other fields you want to permit

  actions :index, :show, :update, :edit, :destroy

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :role
    # Add other columns as needed
    actions
  end

 
  filter :email
  # Add other filters as needed

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone_number
      f.input :email
      f.input :role, as: :select, collection: ['default', 'instructor'], include_blank: false

    end
    f.actions
  end
  
end
