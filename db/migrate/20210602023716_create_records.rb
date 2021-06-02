# frozen_string_literal: true

class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
