class CreateSanctuaries < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuaries do |t|

    t.string :address
    t.float :latitude
    t.float :longitude
    t.integer :user_id, null: false
    t.integer :genre_id, null: false
    t.string :name, null: false
    t.string :place, null: false
    t.string :impression, null: false
    t.timestamps
    end
  end
end
