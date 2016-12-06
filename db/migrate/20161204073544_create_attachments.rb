class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :lecture_id
      t.string :link

      t.timestamps null: false
    end
  end
end
