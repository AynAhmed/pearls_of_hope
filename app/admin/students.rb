ActiveAdmin.register Student do
  permit_params :first_name, :last_name, :dob, :user_id # Add other fields you want to permit

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :dob
    column :user
    # Add other columns as needed
    actions
  end

  filter :first_name
  filter :last_name
  # Add other filters as needed

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :dob, as: :datepicker
      f.input :user
      # Add other inputs as needed
    end
    f.actions
  end
end

