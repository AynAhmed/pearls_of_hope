ActiveAdmin.register Video do
    permit_params :title, :description, :url

    index do
      selectable_column
      id_column
      column :title
      column :description
      column :url
      column :created_at
      actions
    end

    filter :title
    filter :created_at

    form do |f|
      f.inputs 'Video Details' do
        f.input :title
        f.input :description
        f.input :url
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :description
        row :url
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end
  