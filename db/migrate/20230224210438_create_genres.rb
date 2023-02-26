class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
 t.integer :sanctuarys_id, null: false
 ## ジャンルを保存するカラム
 t.string :genre_name, null: false
      t.timestamps
    end
  end
end
