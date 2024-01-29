ActiveAdmin.register SocialMediaEmbed do
    menu parent: 'Website Content'
    permit_params :title, :embed_code
  
    index do
      selectable_column
      id_column
      column :title
      column :embed_code
      actions
    end
  
    form do |f|
      f.inputs do
        f.input :title
        f.input :embed_code, as: :text
      end
      f.actions
    end
  
    # Add additional configurations as needed
  end
  