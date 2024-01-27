class CreateSocialMediaEmbeds < ActiveRecord::Migration[7.1]
  def change
    create_table :social_media_embeds do |t|
      t.string :title
      t.text :embed_code

      t.timestamps
    end
  end
end
