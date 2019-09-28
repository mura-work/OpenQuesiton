class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.integer :favorites_count, default: 0
      t.timestamps
    end
  end
end
