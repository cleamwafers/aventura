class CreateSanctuaries < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuaries do |t|

t.integer :user_id, null: false
t.integer :genre_id, null: false
t.integer :favorite_id, null: false
t.integer :sanctuary_tags_id, null: false
t.float :longitude
t.float :latitude
t.string :name, null: false
t.string :place, null: false
t.string :impression, null: false
      t.timestamps
    end
  end
end
