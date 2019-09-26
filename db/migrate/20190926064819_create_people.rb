class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|

      t.string :person_name
      t.timestamps
    end
    add_index :people, :person_name
  end
end
