ActiveAdmin.register User do
  permit_params :first_name, :last_name, :username, :phone_number, :email, :password, :role_id # Add other fields you want to permit

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :username
    column :email
    # Add other columns as needed
    actions
  end

  filter :username
  filter :email
  # Add other filters as needed

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :phone_number
      f.input :email
      f.input :password
      f.input :role_id
    end
    f.actions
  end
  
end
