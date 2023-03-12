class CreateSanctuaries < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuaries do |t|

    add_column :sanctuarys, :address, :string
    add_column :sanctuarys, :latitude, :float
    add_column :sanctuarys, :longitude, :float

    t.integer :user_id, null: false
    t.integer :genre_id, null: false
    t.integer :favorite_id, null: false
    t.integer :sanctuary_tags_id, null: false
    t.string :name, null: false
    t.string :place, null: false
    t.string :impression, null: false
    t.timestamps
    end
  end
end
