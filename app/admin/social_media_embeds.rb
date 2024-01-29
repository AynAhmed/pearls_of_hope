ActiveAdmin.register SocialMediaEmbed do
    menu parent: 'Website Content'
    permit_params :title, :embed_code

    index do
      selectable_column
      id_column
      column :title
      column "Embed_code" do |code|
        # Shorten the description to 50 characters and add ellipsis
        shortened_embed_code = code.embed_code.truncate(50, separator: ' ', omission: '...')

        # Create a span with a title attribute for tooltip
        span shortened_embed_code, title: code.embed_code
      end
      actions
    end

    form do |f|
      f.inputs do
        f.input :title
        f.input :embed_code, as: :text
      end
      f.actions
    end

    
  end
