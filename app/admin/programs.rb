ActiveAdmin.register Program do
  permit_params :name, :description, :program_type, :age_group, :date,  :fee 

  index do
    selectable_column
    id_column
    column :name
     # Shortened description column
    column "Description" do |program|
      # Shorten the description to 50 characters and add ellipsis
      shortened_description = program.description.truncate(50, separator: ' ', omission: '...')

      # Create a span with a title attribute for tooltip
      span shortened_description, title: program.description
    end
    column :program_type
    column :age_group
    column :date
    column :fee 

   

    # Add other columns as needed

  
    actions
  end

  filter :name
 programs-data-linked

  filter :description
  filter :age_group
  filter :fee
  filter :date

  filter :program_type
  # Add other filters as needed

  form do |f|
    f.inputs do
      f.input :name
      f.input :program_type
      f.input :age_group
      f.input :date
      f.input :fee, as: :select, collection: [["Yes", true], ["No", false]], include_blank: false, prompt: "Select True or False"
      f.input :description, as: :text  # Textarea for longer descriptions
    end
    f.actions
  end
  end


