ActiveAdmin.register TextContent do
    menu parent: 'Website Content'
    permit_params :title, :body

    index do
      selectable_column
      id_column
      column :title
      column "Body" do |text_content|
        # Shorten the description to 50 characters and add ellipsis
        shortened_body = text_content.body.truncate(50, separator: ' ', omission: '...')
  
        # Create a span with a title attribute for tooltip
        span shortened_body, title: text_content.body
      end

      column :created_at
      actions
    end

    filter :title
    filter :created_at

    form do |f|
      f.inputs 'Text Content Details' do
        f.input :title, input_html: { readonly: true, disabled: true }
        f.input :body, as: :text
      end
      f.actions
    end

    show do
      attributes_table do
        row :title
        row :body
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end
