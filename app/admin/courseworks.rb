ActiveAdmin.register Coursework do
  permit_params :name, :description, :program_id, :user_id, attachments: []

  # Customize filters
  filter :name
  filter :description
  #filter :program_id, as: :select, collection: Program.all.map { |p| [p.name, p.id] }
  #filter :user_id, as: :select, collection: User.all.map { |u| [u.email, u.id] }

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :program
    column :user_id 
    column "Attachments" do |coursework|
      coursework.attachments.map { |attachment| link_to attachment.filename, rails_blob_path(attachment, disposition: "attachment") }.join(", ").html_safe
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :program_id, as: :select, collection: Program.all.map { |p| [p.name, p.id] }
      f.input :attachments, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
