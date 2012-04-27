class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string  :title,       null: false, default: ''
      t.text    :description, null: false, default: ''
      t.text    :content,     null: false, default: ''
      t.integer :creator_id,  null: false

      t.timestamps
    end
  end
end
