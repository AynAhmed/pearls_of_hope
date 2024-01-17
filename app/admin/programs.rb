ActiveAdmin.register Program do
  permit_params :name, :description, :type, :age_group, :date # Add other fields you want to permit

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :type
    column :age_group
    column :date
    # Add other columns as needed
    actions
  end

  filter :name
  filter :type
  # Add other filters as needed

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :type
      f.input :age_group
      f.input :date, as: :datepicker
      # Add other inputs as needed
    end
    f.actions
  end
end

