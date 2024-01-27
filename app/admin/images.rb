ActiveAdmin.register Image do
    menu parent: 'Website Content'
    permit_params :title, :image_data
  
    index do
      selectable_column
      id_column
      column :title
      column :image_data
      column :created_at
      actions
    end
  
    filter :title
    filter :created_at
  
    form do |f|
      f.inputs 'Image Details' do
        f.input :title
        f.input :image_data, as: :file
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :image do |image_record|
          image_tag image_record.image_data.url if image_record.image_data.present?
        end
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end
  