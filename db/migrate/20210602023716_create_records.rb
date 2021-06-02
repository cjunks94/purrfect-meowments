class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :name
      t.text :description
      t.integer :active_picture_id

      t.timestamps
    end
  end
end
