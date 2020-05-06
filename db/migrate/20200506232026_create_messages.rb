# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :room, index: true, foreign_key: true, null: false

      t.string :from, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
