class AddAttachmentsToCourseworks < ActiveRecord::Migration[7.1]
  def change
    add_column :courseworks, :attachments, :jsonb
  end
end
